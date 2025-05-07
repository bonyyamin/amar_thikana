/// Constants for API endpoints
class ApiConstants {
  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyToken = '/auth/verify-token';
  static const String refreshToken = '/auth/refresh-token';
  
  // User endpoints
  static const String userProfile = '/users/profile';
  static const String updateProfile = '/users/profile';
  
  // Property endpoints
  static const String properties = '/properties';
  static const String propertyDetails = '/properties/'; // Append property ID
  static const String propertySearch = '/properties/search';
  static const String featuredProperties = '/properties/featured';
  static const String myProperties = '/properties/my-properties';
  
  // Favorites endpoints
  static const String favorites = '/favorites';
  
  // Reviews endpoints
  static const String reviews = '/reviews';
  static const String propertyReviews = '/reviews/property/'; // Append property ID
  
  // Chat endpoints
  static const String conversations = '/chat/conversations';
  static const String messages = '/chat/messages';
}