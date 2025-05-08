import 'package:amar_thikana/core/errors/app_exceptions.dart';
import 'package:amar_thikana/data/dtos/user_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user_dto.dart';
// import '../../core/exceptions.dart';

abstract class UserLocalDataSource {
  /// Gets the cached user profile
  /// Throws [CacheException] if no cached data is present
  Future<UserDto> getLastUserProfile();

  /// Cache the user profile locally
  /// [userDto] - The user data to be cached
  Future<void> cacheUserProfile(UserDto userDto);

  /// Clear the cached user profile
  Future<void> clearUserCache();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String USER_PROFILE_CACHE_KEY = 'user_profile_cache';

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserDto> getLastUserProfile() async {
    final jsonString = sharedPreferences.getString(USER_PROFILE_CACHE_KEY);

    if (jsonString == null) {
      throw CacheException('No cached user profile found.');
    }

    try {
      return UserDto.fromJsonString(jsonString);
    } catch (e) {
      throw CacheException(
        'An error occurred while parsing cached user data: ${e.runtimeType} - ${e.toString()}',
      );
    }
  }

  @override
  Future<void> cacheUserProfile(UserDto userDto) async {
    try {
      await sharedPreferences.setString(
        USER_PROFILE_CACHE_KEY,
        userDto.toJsonString(),
      );
    } catch (e) {
      throw CacheException(
        'An error occurred while caching the user profile: ${e.runtimeType} - ${e.toString()}',
      );
    }
  }

  @override
  Future<void> clearUserCache() async {
    try {
      await sharedPreferences.remove(USER_PROFILE_CACHE_KEY);
    } catch (e) {
      throw CacheException(
        'An error occurred while clearing the user cache: ${e.runtimeType} - ${e.toString()}',
      );
    }
  }
}
