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
    try {
      state = const AuthState.loading();
      
      // Check if there's a current user
      final currentUser = await _authRepository.getCurrentUser();
      
      if (currentUser != null) {
        state = AuthState.authenticated(currentUser);
      } else {
        state = const AuthState.unauthenticated();
      }
      
      // Listen for auth state changes
      _authSubscription = _authRepository.authStateChanges.listen((user) {
        if (user != null) {
          state = AuthState.authenticated(user);
        } else {
          state = const AuthState.unauthenticated();
        }
      });
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('An unexpected error occurred');
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      state = const AuthState.loading();
      final user = await _authRepository.login(email: email, password: password);
      state = AuthState.authenticated(user);
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to login: ${e.toString()}');
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    try {
      state = const AuthState.loading();
      final user = await _authRepository.register(
        email: email,
        password: password,
        name: name,
        userType: userType,
      );
      state = AuthState.authenticated(user);
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to register: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    try {
      state = const AuthState.loading();
      await _authRepository.logout();
      state = const AuthState.unauthenticated();
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to logout: ${e.toString()}');
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      state = const AuthState.loading();
      await _authRepository.forgotPassword(email);
      state = const AuthState.unauthenticated();
    } on Failure catch (e) {
      state = AuthState.error(e.message);
    } catch (e) {
      state = AuthState.error('Failed to reset password: ${e.toString()}');
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}