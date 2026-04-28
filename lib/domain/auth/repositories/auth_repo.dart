import 'package:dartz/dartz.dart';
import 'package:flutter_auth_boilerplate/data/auth/data-source/auth_data_source.dart';
import 'package:flutter_auth_boilerplate/data/auth/repo/auth_repo_impl.dart';
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepoImpl authRepository(Ref ref) {
  return AuthRepoImpl(authDataSource: ref.read(authDataSourceProvider));
}

abstract class AuthRepo {
  Future<Either<String, User>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<String, User>> signInWithGoogle();
  Future<Either<String, User>> signUp(User user);
  Future<Either<String, Unit>> signOut();
  Future<Either<String, User>> getSignedInUser();
  Future<Either<String, Unit>> sendEmailVerification();
  Future<Either<String, Unit>> sendPasswordResetEmail(String email);
  Future<Either<String, Unit>> confirmPasswordReset(
      String code, String newPassword);
  Future<Either<String, User?>> reloadUser();
  Future<Either<String, Unit>> verifyEmail(String code);
}
