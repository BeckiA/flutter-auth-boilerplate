import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  //// progress states
  const factory AuthState.signingIn() = _SigningIn;
  const factory AuthState.signingUp() = _SigningUp;
  const factory AuthState.gettingSignedInUser() = _GettingSignedInUser;
  //// success states
  const factory AuthState.success(User user) = _Success;
  //// error states
  const factory AuthState.errorSigningUp(String message) = _Error;
  const factory AuthState.errorSigningIn(String message) = _ErrorSigningIn;
}
