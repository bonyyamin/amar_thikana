import 'dart:convert';
import 'package:amar_thikana/core/errors/app_exceptions.dart';
import 'package:amar_thikana/data/dtos/user_dto.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  /// Gets the user profile from remote API
  /// Throws [ServerException] for all error codes
  Future<UserDto> getUserProfile();

  /// Updates the user profile on the remote API
  /// [user] - The user data to be updated
  /// Throws [ServerException] for all error codes
  Future<UserDto> updateUserProfile(User user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final String baseUrl;
  final Map<String, String> headers;

  UserRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
    required this.headers,
  });

@override
Future<UserDto> getUserProfile() async {
  try {
    final response = await client.get(
      Uri.parse('$baseUrl/api/user/profile'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return UserDto.fromJson(json.decode(response.body));
    }

    throw ServerException(
      'Server error: Failed to fetch user profile (Status Code: ${response.statusCode})',
      response.statusCode,
    );
  } catch (e) {
    if (e is ServerException) {
      rethrow;
    }
    
    throw NetworkException(
      'Network error occurred while fetching user profile: ${e.runtimeType} - ${e.toString()}',
    );
  }
}

@override
Future<UserDto> updateUserProfile(User user) async {
  try {
    final userDto = UserDto.fromModel(user);

    final response = await client.put(
      Uri.parse('$baseUrl/api/user/profile'),
      headers: {
        ...headers,
        'Content-Type': 'application/json',
      },
      body: userDto.toJsonString(),
    );

    if (response.statusCode == 200) {
      return UserDto.fromJson(json.decode(response.body));
    }

    throw ServerException(
      'Server error: Failed to update user profile (Status Code: ${response.statusCode})',
      response.statusCode,
    );
  } catch (e) {
    if (e is ServerException) {
      rethrow;
    }

    throw NetworkException(
      'Network error occurred while updating user profile: ${e.runtimeType} - ${e.toString()}',
    );
  }
}
}