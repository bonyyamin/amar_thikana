import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../domain/repository/auth_repository_interface.dart';
import 'auth_notifier.dart';
import 'auth_state.dart';

/// Provider for auth repository
final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref);
});

/// Provider for auth state notifier
final authStateNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      final authRepository = ref.watch(authRepositoryProvider);
      return AuthNotifier(authRepository);
    });

/// Provider for current auth state
final authStateProvider = Provider<AuthState>((ref) {
  return ref.watch(authStateNotifierProvider);
});

/// Provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.maybeWhen<bool>(
    (user, isLoading, isAuthenticated, errorMessage) => false,
    authenticated: (user) => true,
    orElse: () => false,
  );
});

/// Provider to get current user
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.maybeWhen<User?>(
    (user, isLoading, isAuthenticated, errorMessage) => null,
    authenticated: (user) => user,
    orElse: () => null,
  );
});

/// Provider to check if user is a landlord
final isLandlordProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateNotifierProvider);
  return authState.maybeWhen<bool>(
    (user, isLoading, isAuthenticated, errorMessage) => false,
    authenticated: (user) => user.userType == UserType.landlord,
    orElse: () => false,
  );
});
