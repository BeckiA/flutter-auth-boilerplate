import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_auth_boilerplate/data/auth/data-source/auth_data_source.dart';
import 'package:flutter_auth_boilerplate/data/auth/models/user/supabase_user.dart';
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:google_sign_in/google_sign_in.dart';

class SupabaseAuthDataSource implements AuthDataSource {
  final sb.SupabaseClient _client;

  SupabaseAuthDataSource({required sb.SupabaseClient client})
      : _client = client;

  @override
  Future<SupabaseUser> getSignedInUser() async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }

      final profileData = await _getUserProfile(user.id);
      return SupabaseUser.fromSupabase(user, profileData);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> _getUserProfile(String userId) async {
    try {
      final data = await _client
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      return data;
    } catch (e) {
      debugPrint('SupabaseAuthDataSource: Error fetching profile: $e');
      return null;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _client.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final scopes = ['email', 'profile'];
      final googleSignIn = GoogleSignIn.instance;

      final googleUser = await googleSignIn.attemptLightweightAuthentication();
      if (googleUser == null) return;

      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
              await googleUser.authorizationClient.authorizeScopes(scopes);

      if (idToken == null) {
        throw Exception('Google Sign-In failed: No ID Token found');
      }

      await _client.auth.signInWithIdToken(
        provider: sb.OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(User user) async {
    try {
      final supabaseUser = SupabaseUser.fromEntity(user);
      final response = await _client.auth.signUp(
        email: supabaseUser.email!,
        password: supabaseUser.password!,
        data: {'name': supabaseUser.name},
        emailRedirectTo: 'com.flutterauthboilerplate://login',
      );

      final sbUser = response.user;
      if (sbUser != null) {
        // Create profile in the 'profiles' table
        await _client.from('profiles').upsert({
          'id': sbUser.id,
          'name': supabaseUser.name,
          'email': supabaseUser.email,
          'bio': supabaseUser.bio,
          'photo_url': supabaseUser.photoUrl,
        });
      } else {
        throw Exception('User creation failed: Supabase returned null user.');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    // Supabase sends verification emails automatically on signUp if configured.
    // To resend, we use reauthenticate or update user.
    try {
      final email = _client.auth.currentUser?.email;
      if (email != null) {
        await _client.auth.resend(
          type: sb.OtpType.signup,
          email: email,
          emailRedirectTo: 'com.flutterauthboilerplate://login',
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _client.auth.resetPasswordForEmail(
        email,
        redirectTo: 'com.flutterauthboilerplate://reset-password',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> confirmPasswordReset(String code, String newPassword) async {
    try {
      // In Supabase, usually you exchange the code for a session then update password.
      // Or use the code directly if it's an OTP.
      // Assuming 'code' is the token from the email link.
      await _client.auth.verifyOTP(
        token: code,
        type: sb.OtpType.recovery,
      );
      await _client.auth.updateUser(sb.UserAttributes(password: newPassword));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> applyActionCode(String code) async {
    try {
      // Mapping Firebase 'applyActionCode' to Supabase 'verifyOTP' for signup/email change
      await _client.auth.verifyOTP(
        token: code,
        type: sb.OtpType.signup,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> reloadUser() async {
    try {
      final session = await _client.auth.refreshSession();
      if (session.user != null) {
        return await getSignedInUser();
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> updateProfile(
      {String? name, String? bio, String? imagePath}) async {
    try {
      final user = _client.auth.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }

      final Map<String, dynamic> updateData = {};
      if (name != null) updateData['name'] = name;
      if (bio != null) updateData['bio'] = bio;

      if (imagePath != null) {
        final uploadedPhotoUrl =
            await _uploadProfileImage(userId: user.id, imagePath: imagePath);
        updateData['photo_url'] = uploadedPhotoUrl;
      }

      if (updateData.isNotEmpty) {
        await _client.from('profiles').update(updateData).eq('id', user.id);
      }

      return await getSignedInUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _uploadProfileImage(
      {required String userId, required String imagePath}) async {
    final imageFile = File(imagePath);
    final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = 'avatars/$userId/$fileName';

    await _client.storage.from('users').upload(path, imageFile);
    return _client.storage.from('users').getPublicUrl(path);
  }
}
