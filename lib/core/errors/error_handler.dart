import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'No user found with this email';
        case 'wrong-password':
          return 'Wrong password provided';
        case 'email-already-in-use':
          return 'An account already exists with this email';
        case 'invalid-email':
          return 'Please enter a valid email address';
        case 'weak-password':
          return 'The password provided is too weak';
        case 'operation-not-allowed':
          return 'This operation is not allowed';
        case 'user-disabled':
          return 'This user account has been disabled';
        default:
          return 'Authentication error: ${error.message}';
      }
    } else if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          return 'You don\'t have permission to perform this action';
        case 'not-found':
          return 'The requested resource was not found';
        case 'already-exists':
          return 'A resource with this ID already exists';
        default:
          return 'Database error: ${error.message}';
      }
    } else if (error is NetworkError) {
      return 'Network error: Please check your internet connection';
    } else if (error is ValidationError) {
      return error.message;
    } else {
      return 'An unexpected error occurred. Please try again later.';
    }
  }
}

class NetworkError implements Exception {
  final String message;
  NetworkError([this.message = 'Network error occurred']);
}

class ValidationError implements Exception {
  final String message;
  ValidationError(this.message);
}

class DatabaseError implements Exception {
  final String message;
  DatabaseError(this.message);
}
