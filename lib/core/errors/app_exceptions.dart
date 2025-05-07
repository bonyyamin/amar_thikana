/// Base exception class for app exceptions
abstract class AppException implements Exception {
  final String message;
  
  AppException(this.message);
  
  @override
  String toString() => message;
}

/// Exception for server-related errors
class ServerException extends AppException {
  final int statusCode;
  
  ServerException(super.message, this.statusCode);
  
  @override
  String toString() => 'ServerException: $message (Status Code: $statusCode)';
}

/// Exception for cache-related errors
class CacheException extends AppException {
  CacheException(super.message);
  
  @override
  String toString() => 'CacheException: $message';
}

/// Exception for network-related errors
class NetworkException extends AppException {
  NetworkException(super.message);
  
  @override
  String toString() => 'NetworkException: $message';
}

/// Exception for validation errors
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;
  
  ValidationException(super.message, [this.errors]);
  
  @override
  String toString() {
    if (errors == null || errors!.isEmpty) {
      return 'ValidationException: $message';
    }
    
    final errorList = errors!.entries
        .map((e) => '${e.key}: ${e.value.join(', ')}')
        .join('\n');
    
    return 'ValidationException: $message\n$errorList';
  }
}

/// Exception for authentication errors
class AuthException extends AppException {
  AuthException(super.message);
  
  @override
  String toString() => 'AuthException: $message';
}

/// Exception for permission errors
class PermissionException extends AppException {
  PermissionException(super.message);
  
  @override
  String toString() => 'PermissionException: $message';
}