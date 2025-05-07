import 'app_exceptions.dart';

/// Base class for failures
class Failure {
  final String message;
  
  const Failure(this.message);
  
  @override
  String toString() => message;
  
  /// Factory constructor to create a Failure from an Exception
  factory Failure.fromException(Exception exception) {
    if (exception is AppException) {
      return Failure(exception.message);
    }
    
    return Failure(exception.toString());
  }
}

/// Failure for authentication errors
class AuthFailure extends Failure {
  AuthFailure(super.message);
}

/// Failure for server errors
class ServerFailure extends Failure {
  final int? statusCode;
  
  ServerFailure(super.message, [this.statusCode]);
  
  @override
  String toString() {
    if (statusCode != null) {
      return '$message (Status Code: $statusCode)';
    }
    return message;
  }
}

/// Failure for network errors
class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

/// Failure for cache errors
class CacheFailure extends Failure {
  CacheFailure(super.message);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  final Map<String, List<String>>? errors;
  
  ValidationFailure(super.message, [this.errors]);
  
  @override
  String toString() {
    if (errors == null || errors!.isEmpty) {
      return message;
    }
    
    final errorList = errors!.entries
        .map((e) => '${e.key}: ${e.value.join(', ')}')
        .join('\n');
    
    return '$message\n$errorList';
  }
}

/// Failure for permission errors
class PermissionFailure extends Failure {
  PermissionFailure(super.message);
}