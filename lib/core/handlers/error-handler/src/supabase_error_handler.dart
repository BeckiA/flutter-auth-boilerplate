import 'package:flutter_auth_boilerplate/core/handlers/error-handler/error_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseErrorHandler implements BaseErrorHandler {
  @override
  String handleError(dynamic error, [StackTrace? stackTrace]) {
    if (error is AuthException) {
      return error.message;
    } else if (error is PostgrestException) {
      return error.message;
    } else if (error is StorageException) {
      return error.message;
    }
    return 'An unexpected Supabase error occurred.';
  }
}
