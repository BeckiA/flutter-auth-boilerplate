import 'dart:async';
import 'dart:io';

import 'package:flutter_auth_boilerplate/core/handlers/error-handler/error_handler.dart';

class NetworkIssueHandler extends BaseErrorHandler {
  @override
  String handleError(error, [StackTrace? stackTrace]) {
    if (error is SocketException) {
      return 'No internet connection';
    } else if (error is TimeoutException) {
      return 'Request timed out';
    } else {
      return 'An error occurred';
    }
  }
}
