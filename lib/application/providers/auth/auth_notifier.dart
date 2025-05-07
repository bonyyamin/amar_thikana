import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repository/auth_repository_interface.dart';
import '../../../domain/models/user/user.dart';
import '../../../core/errors/failure.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _authRepository;
  StreamSubscription<User?>? _authSubscription;

  AuthNotifier(this._authRepository) : super(AuthState.initial()) {
    _initialize();
  }

  void _initialize() async {
    // Check if already loading
    if (state == const AuthState.loading()) return;
    state = const AuthState.loading();

    try {
      final currentUser = await _authRepository.getCurrentUser();
      if (!mounted) return;

      if (currentUser != null) {
        state = AuthState.authenticated(currentUser);
      } else {
        state = const AuthState.unauthenticated();
      }

      // Listen to Firebase auth state changes
      _authSubscription = _authRepository.authStateChanges.listen(
        (user) {
          if (!mounted) return;
          if (user != null) {
            state = AuthState.authenticated(user);
          } else {
            state = const AuthState.unauthenticated();
          }
        },
        onError: (error) {
          if (!mounted) return;
          state = AuthState.error(error.toString());
        },
      );
    } catch (e) {
      if (!mounted) return;
      state = AuthState.error(e.toString());
    }
  }

  Future<bool> login({required String email, required String password}) async {
    // Check if already loading
    if (state == const AuthState.loading()) return false;
    state = const AuthState.loading();

    try {
      final user = await _authRepository.login(
        email: email,
        password: password,
      );
      if (!mounted) return false;

      state = AuthState.authenticated(user);
      return true;
    } on Failure catch (e) {
      if (!mounted) return false;
      state = AuthState.error(e.message);
      return false;
    } catch (e) {
      if (!mounted) return false;
      state = AuthState.error('Failed to login: ${e.toString()}');
      return false;
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    // Check if already loading
    if (state == const AuthState.loading()) return false;
    state = const AuthState.loading();

    try {
      await _authRepository.register(
        email: email,
        password: password,
        name: name,
        userType: userType, phone: '',
      );
      if (!mounted) return false;

      state = const AuthState.unauthenticated();
      return true;
    } on Failure catch (e) {
      if (!mounted) return false;
      state = AuthState.error(e.message);
      return false;
    } catch (e) {
      if (!mounted) return false;
      state = AuthState.error('Failed to register: ${e.toString()}');
      return false;
    }
  }

  Future<bool> logout() async {
    // Check if already loading
    if (state == const AuthState.loading()) return false;
    state = const AuthState.loading();

    try {
      await _authRepository.logout();
      if (!mounted) return false;

      state = const AuthState.unauthenticated();
      return true;
    } on Failure catch (e) {
      if (!mounted) return false;
      state = AuthState.error(e.message);
      return false;
    } catch (e) {
      if (!mounted) return false;
      state = AuthState.error('Failed to logout: ${e.toString()}');
      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    // Check if already loading
    if (state == const AuthState.loading()) return false;
    state = const AuthState.loading();

    try {
      await _authRepository.forgotPassword(email);
      if (!mounted) return false;

      state = const AuthState.unauthenticated();
      return true;
    } on Failure catch (e) {
      if (!mounted) return false;
      state = AuthState.error(e.message);
      return false;
    } catch (e) {
      if (!mounted) return false;
      state = AuthState.error('Failed to reset password: ${e.toString()}');
      return false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      state = const AuthState.loading();
      final user = await _authRepository.signInWithGoogle();
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.error('Google sign in failed');
      }
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to sign in with Google: ${e.toString()}');
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      state = const AuthState.loading();
      final user = await _authRepository.signInWithFacebook();
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.error('Facebook sign in failed');
      }
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error(
        'Failed to sign in with Facebook: ${e.toString()}',
      );
    }
  }

  Future<void> loginWithApple() async {
    try {
      state = const AuthState.loading();
      final user = await _authRepository.signInWithApple();
      if (user != null) {
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.error('Apple sign in failed');
      }
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to sign in with Apple: ${e.toString()}');
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
