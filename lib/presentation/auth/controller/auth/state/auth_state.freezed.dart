// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SigningInImplCopyWith<$Res> {
  factory _$$SigningInImplCopyWith(
          _$SigningInImpl value, $Res Function(_$SigningInImpl) then) =
      __$$SigningInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigningInImpl>
    implements _$$SigningInImplCopyWith<$Res> {
  __$$SigningInImplCopyWithImpl(
      _$SigningInImpl _value, $Res Function(_$SigningInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SigningInImpl implements _SigningIn {
  const _$SigningInImpl();

  @override
  String toString() {
    return 'AuthState.signingIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SigningInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return signingIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return signingIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return signingIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class _SigningIn implements AuthState {
  const factory _SigningIn() = _$SigningInImpl;
}

/// @nodoc
abstract class _$$SigningUpImplCopyWith<$Res> {
  factory _$$SigningUpImplCopyWith(
          _$SigningUpImpl value, $Res Function(_$SigningUpImpl) then) =
      __$$SigningUpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SigningUpImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SigningUpImpl>
    implements _$$SigningUpImplCopyWith<$Res> {
  __$$SigningUpImplCopyWithImpl(
      _$SigningUpImpl _value, $Res Function(_$SigningUpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SigningUpImpl implements _SigningUp {
  const _$SigningUpImpl();

  @override
  String toString() {
    return 'AuthState.signingUp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SigningUpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return signingUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return signingUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (signingUp != null) {
      return signingUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return signingUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return signingUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (signingUp != null) {
      return signingUp(this);
    }
    return orElse();
  }
}

abstract class _SigningUp implements AuthState {
  const factory _SigningUp() = _$SigningUpImpl;
}

/// @nodoc
abstract class _$$GettingSignedInUserImplCopyWith<$Res> {
  factory _$$GettingSignedInUserImplCopyWith(_$GettingSignedInUserImpl value,
          $Res Function(_$GettingSignedInUserImpl) then) =
      __$$GettingSignedInUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GettingSignedInUserImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$GettingSignedInUserImpl>
    implements _$$GettingSignedInUserImplCopyWith<$Res> {
  __$$GettingSignedInUserImplCopyWithImpl(_$GettingSignedInUserImpl _value,
      $Res Function(_$GettingSignedInUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GettingSignedInUserImpl implements _GettingSignedInUser {
  const _$GettingSignedInUserImpl();

  @override
  String toString() {
    return 'AuthState.gettingSignedInUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GettingSignedInUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return gettingSignedInUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return gettingSignedInUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (gettingSignedInUser != null) {
      return gettingSignedInUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return gettingSignedInUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return gettingSignedInUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (gettingSignedInUser != null) {
      return gettingSignedInUser(this);
    }
    return orElse();
  }
}

abstract class _GettingSignedInUser implements AuthState {
  const factory _GettingSignedInUser() = _$GettingSignedInUserImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthState {
  const factory _Success(final User user) = _$SuccessImpl;

  User get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.errorSigningUp(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return errorSigningUp(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return errorSigningUp?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (errorSigningUp != null) {
      return errorSigningUp(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return errorSigningUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return errorSigningUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (errorSigningUp != null) {
      return errorSigningUp(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSigningInImplCopyWith<$Res> {
  factory _$$ErrorSigningInImplCopyWith(_$ErrorSigningInImpl value,
          $Res Function(_$ErrorSigningInImpl) then) =
      __$$ErrorSigningInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorSigningInImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorSigningInImpl>
    implements _$$ErrorSigningInImplCopyWith<$Res> {
  __$$ErrorSigningInImplCopyWithImpl(
      _$ErrorSigningInImpl _value, $Res Function(_$ErrorSigningInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorSigningInImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorSigningInImpl implements _ErrorSigningIn {
  const _$ErrorSigningInImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.errorSigningIn(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSigningInImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSigningInImplCopyWith<_$ErrorSigningInImpl> get copyWith =>
      __$$ErrorSigningInImplCopyWithImpl<_$ErrorSigningInImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signingIn,
    required TResult Function() signingUp,
    required TResult Function() gettingSignedInUser,
    required TResult Function(User user) success,
    required TResult Function(String message) errorSigningUp,
    required TResult Function(String message) errorSigningIn,
  }) {
    return errorSigningIn(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signingIn,
    TResult? Function()? signingUp,
    TResult? Function()? gettingSignedInUser,
    TResult? Function(User user)? success,
    TResult? Function(String message)? errorSigningUp,
    TResult? Function(String message)? errorSigningIn,
  }) {
    return errorSigningIn?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signingIn,
    TResult Function()? signingUp,
    TResult Function()? gettingSignedInUser,
    TResult Function(User user)? success,
    TResult Function(String message)? errorSigningUp,
    TResult Function(String message)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (errorSigningIn != null) {
      return errorSigningIn(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SigningIn value) signingIn,
    required TResult Function(_SigningUp value) signingUp,
    required TResult Function(_GettingSignedInUser value) gettingSignedInUser,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) errorSigningUp,
    required TResult Function(_ErrorSigningIn value) errorSigningIn,
  }) {
    return errorSigningIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SigningIn value)? signingIn,
    TResult? Function(_SigningUp value)? signingUp,
    TResult? Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? errorSigningUp,
    TResult? Function(_ErrorSigningIn value)? errorSigningIn,
  }) {
    return errorSigningIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SigningIn value)? signingIn,
    TResult Function(_SigningUp value)? signingUp,
    TResult Function(_GettingSignedInUser value)? gettingSignedInUser,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? errorSigningUp,
    TResult Function(_ErrorSigningIn value)? errorSigningIn,
    required TResult orElse(),
  }) {
    if (errorSigningIn != null) {
      return errorSigningIn(this);
    }
    return orElse();
  }
}

abstract class _ErrorSigningIn implements AuthState {
  const factory _ErrorSigningIn(final String message) = _$ErrorSigningInImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSigningInImplCopyWith<_$ErrorSigningInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
