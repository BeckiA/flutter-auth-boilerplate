import 'package:flutter_auth_boilerplate/domain/auth/entities/user.dart';
import 'package:flutter_auth_boilerplate/domain/auth/repositories/auth_repo.dart';
import 'package:flutter_auth_boilerplate/presentation/auth/controller/auth/state/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late AuthRepo _authRepo;
  @override
  AuthState build() {
    _authRepo = ref.read(authRepositoryProvider);
    getCurrentUser(useLoading: true);
    return const AuthState.initial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthState.signingIn();
    final result = await _authRepo.signInWithEmailAndPassword(email, password);

    state = result.fold((error) => AuthState.errorSigningIn(error),
        (user) => AuthState.success(user));
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.signingIn();
    final result = await _authRepo.signInWithGoogle();

    state = result.fold((error) => AuthState.errorSigningIn(error),
        (user) => AuthState.success(user));
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AuthState.signingUp();
    final result = await _authRepo
        .signUp(User(name: name, email: email, password: password));
    state = result.fold((error) => AuthState.errorSigningUp(error),
        (user) => AuthState.success(user));
  }

  Future<void> signOut() async {
    await _authRepo.signOut();
    state = const AuthState.initial();
  }

  Future<User?> getCurrentUser({bool useLoading = false}) async {
    if (useLoading) state = const AuthState.gettingSignedInUser();
    final result = await _authRepo.getSignedInUser();
    return result.fold((String sd) {
      state = const AuthState.initial();
      return null;
    }, (User user) {
      state = AuthState.success(user);
      return user;
    });
  }

  Future<void> updateProfile({String? name, String? bio}) async {
    // TODO: Implement updateProfile
  }
}
