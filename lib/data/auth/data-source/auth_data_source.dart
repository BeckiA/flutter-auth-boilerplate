import 'package:flutter_auth_boilerplate/data/auth/data-source/supabase_auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  return SupabaseAuthDataSource(
    client: sb.Supabase.instance.client,
  );
}

abstract class AuthDataSource {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signUp(User user);
  Future<void> signOut();
  Future<User> getSignedInUser();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> confirmPasswordReset(String code, String newPassword);
  Future<User?> reloadUser();
  Future<void> applyActionCode(String code);
  Future<User> updateProfile({String? name, String? bio, String? imagePath});
}
