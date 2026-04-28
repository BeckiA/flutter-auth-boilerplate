import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_auth_boilerplate/core/handlers/error-handler/error_handler.dart';
import 'package:flutter_auth_boilerplate/data/auth/data-source/auth_data_source.dart';
import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:flutter_auth_boilerplate/domain/auth/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<String, User>> getSignedInUser() async {
    try {
      final user = await authDataSource.getSignedInUser();
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await authDataSource.signInWithEmailAndPassword(email, password);
      final fetchedUser = await authDataSource.getSignedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> signInWithGoogle() async {
    try {
      await authDataSource.signInWithGoogle();
      final fetchedUser = await authDataSource.getSignedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      debugPrint('AuthRepoImpl.signInWithGoogle error: $e');
      debugPrint('AuthRepoImpl.signInWithGoogle stackTrace: $stackTrace');
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> signOut() async {
    try {
      await authDataSource.signOut();
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> signUp(User user) async {
    try {
      await authDataSource.signUp(user);
      final fetchedUser = await authDataSource.getSignedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> sendEmailVerification() async {
    try {
      await authDataSource.sendEmailVerification();
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await authDataSource.sendPasswordResetEmail(email);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> confirmPasswordReset(
      String code, String newPassword) async {
    try {
      await authDataSource.confirmPasswordReset(code, newPassword);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User?>> reloadUser() async {
    try {
      final user = await authDataSource.reloadUser();
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> verifyEmail(String code) async {
    try {
      await authDataSource.applyActionCode(code);
      return const Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> updateProfile(
      {String? name, String? bio, String? imagePath}) async {
    try {
      final user = await authDataSource.updateProfile(
        name: name,
        bio: bio,
        imagePath: imagePath,
      );
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
