import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_auth_boilerplate/core/extensions/firebase_firestore_extensions.dart';
import 'package:flutter_auth_boilerplate/data/auth/data-source/auth_data_source.dart';
import 'package:flutter_auth_boilerplate/data/auth/models/user/firebase_user.dart';
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:google_sign_in/google_sign_in.dart' as gsis;

class FirebaseAuthDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseAuthDataSource(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firebaseFirestore})
      : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<FirebaseUser> getSignedInUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        throw Exception('User not found');
      }
      final userId = user.uid;
      final userDoc = await _firebaseFirestore.userDocument(userId).get();

      if (!userDoc.exists) {
        throw Exception('User not found');
      }
      final firebaseUser = FirebaseUser.fromDoc(userDoc);
      return firebaseUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      /// sign-in on firebase-auth.
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await gsis.GoogleSignIn.instance.signOut();
      return await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      debugPrint('FirebaseAuthDataSource.signInWithGoogle: Starting');
      
      // In google_sign_in 7.x, authenticate() is the recommended way for identity
      final gsis.GoogleSignInAccount? googleUser =
          await gsis.GoogleSignIn.instance.authenticate();

      if (googleUser == null) {
        debugPrint('FirebaseAuthDataSource.signInWithGoogle: User cancelled');
        return;
      }
      debugPrint('FirebaseAuthDataSource.signInWithGoogle: Authenticated');

      final gsis.GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      debugPrint('FirebaseAuthDataSource.signInWithGoogle: Got Authentication');

      // For Firebase Auth, idToken is sufficient and much smoother than
      // requesting extra scopes for an accessToken via authorizeScopes().
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      debugPrint(
          'FirebaseAuthDataSource.signInWithGoogle: Signing in with credential');
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        debugPrint(
            'FirebaseAuthDataSource.signInWithGoogle: User signed in: ${userCredential.user!.uid}');
        final userId = userCredential.user!.uid;
        final userDoc = await _firebaseFirestore.userDocument(userId).get();
        if (!userDoc.exists) {
          debugPrint(
              'FirebaseAuthDataSource.signInWithGoogle: Creating new user document');
          // save new google user to firestore.
          final firebaseUser = FirebaseUser(
            id: userId,
            email: userCredential.user!.email ?? '',
            name: userCredential.user!.displayName ?? '',
          );
          await _firebaseFirestore.userDocument(userId).set(
                firebaseUser.toDoc(),
              );
        }
      }
      debugPrint('FirebaseAuthDataSource.signInWithGoogle: Success');
    } catch (e, stackTrace) {
      debugPrint('FirebaseAuthDataSource.signInWithGoogle error: $e');
      debugPrint(
          'FirebaseAuthDataSource.signInWithGoogle stackTrace: $stackTrace');
      rethrow;
    }
  }

  @override
  Future<void> signUp(User user) async {
    try {
      final firebaseUser = FirebaseUser.fromEntity(user);
      // create a user on firebase-auth.
      final cred = await _firebaseAuth.createUserWithEmailAndPassword(
          email: firebaseUser.email!, password: firebaseUser.password!);
      if (cred.user == null) {
        throw Exception('User not created');
      }
      final userId = cred.user?.uid;
      // save user to firestore.
      await _firebaseFirestore.userDocument(userId).set(
            firebaseUser.toDoc(),
          );
    } catch (e) {
      rethrow;
    }
  }
}
