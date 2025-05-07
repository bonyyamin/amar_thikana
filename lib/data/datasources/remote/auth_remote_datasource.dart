import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/errors/app_exceptions.dart';
import '../../../domain/models/user/user.dart';

abstract class IAuthRemoteDataSource {
  /// Login with email and password
  /// Returns user data if successful
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  /// Register a new user
  /// Returns user data if successful
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
    required String userType, required String phone,
  });

  /// Send password reset email
  Future<bool> forgotPassword(String email);

  /// Get user by email
  /// Returns null if user doesn't exist
  Future<User?> getUserByEmail(String email);

  /// Create a new user in the backend
  /// Returns the created user
  Future<User> createUser(User user);

  /// Verify auth token
  /// Returns user data if token is valid
  Future<Map<String, dynamic>> verifyToken(String token);
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(
          response.data['message'] ?? 'Failed to login',
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to connect to server', 500);
    }
  }

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String name,
    required String userType,
    required String phone,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'userType': userType,
        },
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw ServerException(
          response.data['message'] ?? 'Failed to register',
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to connect to server', 500);
    }
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.forgotPassword,
        data: {'email': email},
      );

      return response.statusCode == 200;
    } catch (e) {
      throw ServerException('Failed to send password reset email', 500);
    }
  }

  @override
  Future<Map<String, dynamic>> verifyToken(String token) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.verifyToken,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(
          response.data['message'] ?? 'Invalid token',
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to verify token', 500);
    }
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.users}/email/$email',
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else if (response.statusCode == 404) {
        return null;
      } else {
        throw ServerException(
          response.data['message'] ?? 'Failed to get user',
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to connect to server', 500);
    }
  }

  @override
  Future<User> createUser(User user) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.users,
        data: user.toJson(),
      );

      if (response.statusCode == 201) {
        return User.fromJson(response.data);
      } else {
        throw ServerException(
          response.data['message'] ?? 'Failed to create user',
          response.statusCode ?? 500,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to connect to server', 500);
    }
  }
}

final authRemoteDataSourceProvider = Provider<IAuthRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider) as ApiClient;
  return AuthRemoteDataSource(apiClient);
});
