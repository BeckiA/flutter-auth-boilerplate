import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_boilerplate/core/handlers/error-handler/error_handler.dart';

class FirebaseErrorHandler implements BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is FirebaseAuthException) {
      final message = _handleFirebaseAuthException(error);
      return message;
    } else if (error is FirebaseException) {
      final message = _handleFirebaseException(error);
      return message;
    }
    return 'An error occurred';
  }

  String _handleFirebaseAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An error occurred';
    }
  }

  _handleFirebaseException(FirebaseException error) {
    switch (error.code) {
      case 'permission-denied':
        return 'Permission denied';
      default:
        return 'An error occurred';
    }
  }
}
