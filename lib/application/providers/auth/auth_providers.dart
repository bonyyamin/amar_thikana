import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provides the raw FirebaseAuth instance
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Provides a stream of the authentication state changes
final authStateChangesProvider = StreamProvider<User?>((ref) {
  // Watch the FirebaseAuth instance provider
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  // Return the authStateChanges stream
  return firebaseAuth.authStateChanges();
});

// Optional: Provider to just get the current user (useful for one-off checks)
final currentUserProvider = Provider<User?>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return firebaseAuth.currentUser;
});