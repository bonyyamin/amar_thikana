import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../domain/models/user/user.dart';

abstract class IAuthLocalDataSource {
  /// Stores user data in local storage
  Future<void> cacheUserData(User user);

  /// Gets cached user data from local storage
  Future<User?> getCachedUserData();

  /// Clears user data from local storage
  Future<void> clearCachedUserData();

  /// Checks if user is logged in
  Future<bool> isLoggedIn();

  /// Stores auth token in secure storage
  Future<void> saveAuthToken(String token);

  /// Gets auth token from secure storage
  Future<String?> getAuthToken();

  /// Clears auth token from secure storage
  Future<void> clearAuthToken();
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final SecureStorage _secureStorage;
  static const String _userKey = 'user_data';
  static const String _tokenKey = 'auth_token';

  AuthLocalDataSource(this._secureStorage);

  @override
  Future<void> cacheUserData(User user) async {
    final userJson = jsonEncode(user.toJson());
    await _secureStorage.write(key: _userKey, value: userJson);
  }

  @override
  Future<User?> getCachedUserData() async {
    final userJson = await _secureStorage.read(key: _userKey);
    if (userJson == null) return null;
    
    try {
      return User.fromJson(jsonDecode(userJson));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearCachedUserData() async {
    await _secureStorage.delete(key: _userKey);
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await getAuthToken();
    return token != null;
  }

  @override
  Future<void> saveAuthToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getAuthToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearAuthToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}

final authLocalDataSourceProvider = Provider<IAuthLocalDataSource>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return AuthLocalDataSource(secureStorage);
});