import 'package:dio/dio.dart';
import '../../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  static const String _tokenKey = 'auth_token';

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get auth token from secure storage
    final token = await _secureStorage.read(key: _tokenKey);

    // If token exists, add it to headers
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Continue with request
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Check if error is 401 (Unauthorized)
    if (err.response?.statusCode == 401) {
      // Clear token if unauthorized
      await _secureStorage.delete(key: _tokenKey);
    }

    // Continue with error
    return handler.next(err);
  }
}