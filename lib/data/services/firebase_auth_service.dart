import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for Firebase Auth Service
final firebaseAuthServiceProvider = Provider<IFirebaseAuthService>((ref) {
  return FirebaseAuthService(firebase_auth.FirebaseAuth.instance);
});

class FirebaseAuthException implements Exception {
  final String message;
  FirebaseAuthException(this.message);
}

abstract class IFirebaseAuthService {
  Stream<firebase_auth.User?> get authStateChanges;
  
  Future<firebase_auth.User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<firebase_auth.User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<void> signOut();
  
  Future<void> sendPasswordResetEmail(String email);
  
  Future<void> updateDisplayName(String name);
  
  firebase_auth.User? get currentUser;
}

class FirebaseAuthService implements IFirebaseAuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  @override
  Stream<firebase_auth.User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  firebase_auth.User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<firebase_auth.User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    } catch (e) {
      throw FirebaseAuthException('Failed to sign in: ${e.toString()}');
    }
  }

  @override
  Future<firebase_auth.User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    } catch (e) {
      throw FirebaseAuthException('Failed to create account: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw FirebaseAuthException('Failed to sign out: ${e.toString()}');
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthError(e);
    } catch (e) {
      throw FirebaseAuthException('Failed to send password reset email: ${e.toString()}');
    }
  }

  @override
  Future<void> updateDisplayName(String name) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
      }
    } catch (e) {
      throw FirebaseAuthException('Failed to update profile: ${e.toString()}');
    }
  }

  FirebaseAuthException _handleFirebaseAuthError(firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return FirebaseAuthException('No user found with this email');
      case 'wrong-password':
        return FirebaseAuthException('Incorrect password');
      case 'email-already-in-use':
        return FirebaseAuthException('Email is already in use');
      case 'weak-password':
        return FirebaseAuthException('Password is too weak');
      case 'invalid-email':
        return FirebaseAuthException('Invalid email address');
      case 'user-disabled':
        return FirebaseAuthException('This account has been disabled');
      case 'too-many-requests':
        return FirebaseAuthException('Too many failed login attempts. Please try again later');
      default:
        return FirebaseAuthException(e.message ?? 'Authentication failed');
    }
  }
}