/// Configuration class for API-related settings
class ApiConfig {
  /// Base URL for API requests
  static const String baseUrl = 'https://api.amarthikana.com/v1';

  /// Timeout duration for API requests in seconds
  static const int timeoutDuration = 30;

  /// API version
  static const String apiVersion = 'v1';

  /// Endpoints
  static const String authEndpoint = '/auth';
  static const String usersEndpoint = '/users';
  static const String propertiesEndpoint = '/properties';
  static const String conversationsEndpoint = '/conversations';

  /// Authentication endpoints
  static String get loginEndpoint => '$authEndpoint/login';
  static String get registerEndpoint => '$authEndpoint/register';
  static String get refreshTokenEndpoint => '$authEndpoint/refresh';
  static String get forgotPasswordEndpoint => '$authEndpoint/forgot-password';
  static String get resetPasswordEndpoint => '$authEndpoint/reset-password';

  /// User endpoints
  static String userEndpoint(String userId) => '$usersEndpoint/$userId';
  static String userProfileEndpoint(String userId) =>
      '${userEndpoint(userId)}/profile';

  /// Property endpoints
  static String propertyEndpoint(String propertyId) =>
      '$propertiesEndpoint/$propertyId';
  static String propertyImagesEndpoint(String propertyId) =>
      '${propertyEndpoint(propertyId)}/images';

  /// Conversation endpoints
  static String conversationEndpoint(String conversationId) =>
      '$conversationsEndpoint/$conversationId';
  static String conversationMessagesEndpoint(String conversationId) =>
      '${conversationEndpoint(conversationId)}/messages';
}
