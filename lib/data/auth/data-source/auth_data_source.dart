import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'firebase_auth_data_source.dart';
part 'auth_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthDataSource authDataSource(Ref ref) {
  return FirebaseAuthDataSource(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance);
}

abstract class AuthDataSource {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signUp(User user);
  Future<void> signOut();
  Future<User> getSignedInUser();
  Future<void> sendEmailVerification();
  Future<User?> reloadUser();
  Future<void> applyActionCode(String code);
}
