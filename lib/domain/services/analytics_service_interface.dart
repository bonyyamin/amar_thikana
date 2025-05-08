/// Represents user properties that can be set for analytics
class UserProperties {
  final String? userId;
  final Map<String, dynamic> properties;

  UserProperties({this.userId, this.properties = const {}});
}

abstract class AnalyticsServiceInterface {
  /// Initializes the analytics service.
  /// Returns [true] if initialization is successful, [false] otherwise.
  Future<bool> initialize();

  /// Logs an event with optional parameters.
  /// [eventName] is the name of the event to log.
  /// [parameters] is a map of additional data to associate with the event.
  Future<void> logEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  });

  /// Sets user properties for analytics tracking.
  /// [properties] contains user information and custom properties.
  Future<void> setUserProperties(UserProperties properties);

  /// Sets the user ID for the current user.
  /// [userId] is a unique identifier for the user.
  Future<void> setUserId(String userId);

  /// Clears the user ID and resets user-associated data.
  Future<void> resetUser();

  /// Enables analytics collection.
  /// Returns [true] if successfully enabled, [false] otherwise.
  Future<bool> enable();

  /// Disables analytics collection.
  /// Returns [true] if successfully disabled, [false] otherwise.
  Future<bool> disable();

  /// Checks if analytics collection is enabled.
  /// Returns [true] if enabled, [false] otherwise.
  Future<bool> isEnabled();

  /// Logs a screen view event.
  /// [screenName] is the name of the screen being viewed.
  /// [screenClass] is an optional class name or identifier for the screen.
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  });

  /// Logs an error event.
  /// [error] is the error that occurred.
  /// [stackTrace] is the stack trace for the error.
  /// [fatal] indicates if the error was fatal to the application.
  Future<void> logError({
    required dynamic error,
    StackTrace? stackTrace,
    bool fatal = false,
  });

  /// Flushes any pending analytics events immediately.
  /// This is useful when the app is about to terminate.
  Future<void> flushEvents();
}