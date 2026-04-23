import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../presentation/auth/controller/auth/auth_provider.dart';

// Extension for Ref
extension UserRefExtension on Ref {
  User? get watchCurrentUser => watch(authNotifierProvider).mapOrNull(
        success: (success) => success.user,
      );

  User? get readCurrentUser => read(authNotifierProvider).mapOrNull(
        success: (success) => success.user,
      );
}

// Extension for WidgetRef
extension UserWidgetRefExtension on WidgetRef {
  User? get watchCurrentUser => watch(authNotifierProvider).mapOrNull(
        success: (success) => success.user,
      );

  User? get readCurrentUser => read(authNotifierProvider).mapOrNull(
        success: (success) => success.user,
      );
}
