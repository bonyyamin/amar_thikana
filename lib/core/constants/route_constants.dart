/// Parameter names used in routes
class RouteParams {
  static const String id = 'id';
  static const String propertyId = 'propertyId';
  static const String userId = 'userId';
  static const String category = 'category';
  static const String query = 'query';
  static const String filter = 'filter';
  static const String page = 'page';
}

/// Query parameter names used in routes
class QueryParams {
  static const String sort = 'sort';
  static const String order = 'order';
  static const String limit = 'limit';
  static const String offset = 'offset';
  static const String latitude = 'lat';
  static const String longitude = 'lng';
  static const String radius = 'radius';
  static const String minPrice = 'minPrice';
  static const String maxPrice = 'maxPrice';
  static const String bedrooms = 'bedrooms';
  static const String bathrooms = 'bathrooms';
  static const String propertyType = 'propertyType';
  static const String amenities = 'amenities';
}

/// Route types for transitions
class RouteTypes {
  static const String defaultRoute = 'default';
  static const String fadeRoute = 'fade';
  static const String slideRoute = 'slide';
  static const String noTransition = 'none';
}

/// Deep link prefixes
class DeepLinks {
  static const String scheme = 'amarthikana';
  static const String host = 'app';
  static const String propertyDetails = '/property/details';
  static const String userProfile = '/user/profile';
  static const String search = '/search';
  static const String bookmarks = '/bookmarks';
  static const String settings = '/settings';
}

/// Tab indexes for bottom navigation
class TabIndexes {
  static const int renterHome = 0;
  static const int renterSearch = 1;
  static const int renterBookmarks = 2;
  static const int renterMessages = 3;
  static const int renterProfile = 4;

  static const int landlordHome = 0;
  static const int landlordListings = 1;
  static const int landlordAddProperty = 2;
  static const int landlordMessages = 3;
  static const int landlordProfile = 4;
}

/// Named routes for easy reference
class NamedRoutes {
  // Common routes
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String notifications = 'notifications';
  static const String messages = 'messages';
  static const String conversation = 'conversation';
  
  // Renter-specific routes
  static const String search = 'search';
  static const String searchResults = 'searchResults';
  static const String bookmarks = 'bookmarks';
  static const String rentHistory = 'rentHistory';
  
  // Landlord-specific routes
  static const String tenants = 'tenants';
  static const String propertyAnalytics = 'propertyAnalytics';
  static const String payments = 'payments';
}

/// Application-wide route constants container
class RouteConstants {
  static var params = RouteParams();
  static var query = QueryParams();
  static var types = RouteTypes();
  static var deepLinks = DeepLinks();
  static var tabs = TabIndexes();
  static var routes = NamedRoutes();
}