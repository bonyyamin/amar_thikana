/// API endpoint paths
class ApiEndpoints {
  static const String properties = 'properties';
  static const String users = 'users';
  static const String auth = 'auth';
  static const String search = 'search';
  static const String bookmarks = 'bookmarks';
  static const String rentals = 'rentals';
  static const String reviews = 'reviews';
  static const String messages = 'messages';
}

/// Timeout durations for API requests
class Timeouts {
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
}

/// Image-related constants
class ImageConstants {
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int thumbnailWidth = 200;
  static const int thumbnailHeight = 200;
  static const int maxImagesPerProperty = 10;
  static const List<String> allowedImageExtensions = [
    'jpg', 'jpeg', 'png', 'webp'
  ];
}

/// Cache-related constants
class CacheConstants {
  static const Duration defaultCacheDuration = Duration(hours: 1);
  static const String propertiesCache = 'properties_cache';
  static const String userProfileCache = 'user_profile_cache';
  static const String bookmarksCache = 'bookmarks_cache';
  static const int maxCacheSize = 50 * 1024 * 1024; // 50MB
}

/// Validation constants
class ValidationConstants {
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int maxUsernameLength = 50;
  static const int minUsernameLength = 3;
  static const int minPropertyTitleLength = 5;
  static const int maxPropertyTitleLength = 100;
  static const int maxPropertyDescriptionLength = 2000;
}

/// Local storage keys
class StorageKeys {
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userRole = 'user_role';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String appTheme = 'app_theme';
  static const String appLanguage = 'app_language';
  static const String lastSync = 'last_sync';
}

/// Default values
class Defaults {
  static const int defaultPageSize = 20;
  static const int maxSearchResults = 100;
  static const double defaultLatitude = 23.8103;  // Dhaka, Bangladesh
  static const double defaultLongitude = 90.4125;
  static const double defaultMapZoom = 13.0;
  static const String defaultCurrency = 'BDT';
  static const String dateFormat = 'dd-MM-yyyy';
  static const String timeFormat = 'HH:mm';
}

/// Application-wide constants container
class AppConstants {
  static var api = ApiEndpoints();
  static var timeouts = Timeouts();
  static var images = ImageConstants();
  static var cache = CacheConstants();
  static var validation = ValidationConstants();
  static var storage = StorageKeys();
  static var defaults = Defaults();
}