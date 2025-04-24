import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_state.dart';
import '../../../data/services/social_auth_service.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _socialAuth = SocialAuthService();

  Future<bool> login({required String email, required String password}) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final role = await _getUserRole(userCredential.user?.uid);
      state = state.copyWith(isLoading: false, role: role);
      return true;
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getAuthErrorMessage(e.code),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred',
      );
      return false;
    }
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found for this email';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Authentication error: $code';
    }
  }

  Future<String> _getUserRole(String? uid) async {
    if (uid == null) throw Exception('User ID is null');

    final doc = await _firestore.collection('users').doc(uid).get();
    final role = doc.data()?['role'] as String? ?? 'unknown';

    if (!['renter', 'landlord'].contains(role)) {
      throw Exception('Invalid user role: $role');
    }

    return role;
  }

  Future<void> loginWithGoogle() async {
    state = state.copyWith(isLoading: true);
    final result = await _socialAuth.signInWithGoogle();
    _handleSocialLoginResult(result);
  }

  Future<void> loginWithFacebook() async {
    state = state.copyWith(isLoading: true);
    final result = await _socialAuth.signInWithFacebook();
    _handleSocialLoginResult(result);
  }

  Future<void> loginWithApple() async {
    state = state.copyWith(isLoading: true);
    final result = await _socialAuth.signInWithApple();
    _handleSocialLoginResult(result);
  }

  void _handleSocialLoginResult(UserCredential? result) {
    if (result == null) {
      state = state.copyWith(isLoading: false, errorMessage: 'Login failed');
      return;
    }

    final uid = result.user?.uid;
    if (uid == null) {
      state = state.copyWith(isLoading: false, errorMessage: 'User ID is null');
      return;
    }

    _firestore
        .collection('users')
        .doc(uid)
        .get()
        .then((doc) {
          final role = doc.data()?['role'] ?? 'unknown';
          state = state.copyWith(role: role, isLoading: false);
        })
        .catchError((error) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: 'Failed to fetch user role',
          );
        });
  }

  /// Registers a new user with email, password, name, and role.
  Future<_RegisterResult> register({
    required String name,
    required String email,
    required String password,
    required dynamic role, // Accepts UserRole or String
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user?.uid;
      if (uid == null) {
        state = state.copyWith(isLoading: false);
        return _RegisterResult(false, 'Registration failed: No user ID');
      }

      // Convert role to string if needed
      final roleStr = role is String ? role : role.toString().split('.').last;

      // Store user info in Firestore
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'role': roleStr,
        'createdAt': FieldValue.serverTimestamp(),
      });

      state = state.copyWith(isLoading: false, role: roleStr);
      return _RegisterResult(true, 'Registration successful! Please log in.');
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: _getRegisterErrorMessage(e.code),
      );
      return _RegisterResult(false, _getRegisterErrorMessage(e.code));
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred',
      );
      return _RegisterResult(false, 'An unexpected error occurred');
    }
  }

  String _getRegisterErrorMessage(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email is already in use';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      default:
        return 'Registration error: $code';
    }
  }
}

/// Simple result class for registration
class _RegisterResult {
  final bool success;
  final String message;
  _RegisterResult(this.success, this.message);
}
