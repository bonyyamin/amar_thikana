import '../models/user/user.dart';
import '../../core/errors/failure.dart';

/// Interface for authentication repository
abstract class IAuthRepository {
  /// Authenticates a user with email and password
  /// Returns a user if successful, otherwise throws a [Failure]
  Future<User> login({required String email, required String password});

  /// Registers a new user with email and password
  /// Returns a user if successful, otherwise throws a [Failure]
  Future<User> register({
    required String email,
    required String password,
    required String name,
    required String userType, required String phone,
  });

  /// Signs the user out
  /// Returns true if successful, otherwise throws a [Failure]
  Future<bool> logout();

  /// Sends a password reset email
  /// Returns true if successful, otherwise throws a [Failure]
  Future<bool> forgotPassword(String email);

  /// Checks if a user is currently authenticated
  /// Returns a User object if authenticated, otherwise returns null
  Future<User?> getCurrentUser();

  /// Stream of authentication state changes
  /// Emits a User when signed in, null when signed out
  Stream<User?> get authStateChanges;

  /// Signs in a user with Google
  /// Returns a user if successful, otherwise throws a [Failure]
  Future<User?> signInWithGoogle();

  /// Signs in a user with Facebook
  /// Returns a user if successful, otherwise throws a [Failure]
  Future<User?> signInWithFacebook();

  /// Signs in a user with Apple
  /// Returns a user if successful, otherwise throws a [Failure]
  Future<User?> signInWithApple();
}
