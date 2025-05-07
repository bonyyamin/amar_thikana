class RouteNames {
  // Authentication & Onboarding
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Renter Routes
  static const String renterNavigation = '/renter';
  static const String renterHome = '/renter/home';
  static const String renterPropertyDetails = '/renter/property/:id';

  // Landlord Routes
  static const String landlordNavigation = '/landlord';
  static const String landlordHome = '/landlord/home';
  static const String landlordPropertyDetails = '/landlord/property/:id';
  static const String addProperty = '/landlord/property/add';
  static const String editProperty = '/landlord/property/:id/edit';
  static const String myListings = '/landlord/listings';
  static const String propertyPreview = '/landlord/property/:id/preview';
}
