import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? errorMessage,
  }) = _AuthState;
  

  /// Initial state with no user and not loading
  factory AuthState.initial() => const AuthState(
        user: null,
        isLoading: false,
        isAuthenticated: false,
        errorMessage: null,
      );

  /// Loading state
  const factory AuthState.loading() = _Loading;

  /// Authenticated state with user
  const factory AuthState.authenticated(User user) = _Authenticated;

  /// Unauthenticated state
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Error state with error message
  const factory AuthState.error(String message) = _Error;
}