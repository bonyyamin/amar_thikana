abstract class NotificationServiceInterface {
  /// Initializes the notification service.
  /// Returns [true] if initialization is successful, [false] otherwise.
  Future<bool> initialize();
  
  /// Requests notification permissions from the user.
  /// Returns [true] if permission is granted, [false] otherwise.
  Future<bool> requestPermission();
  
  /// Checks if notification permissions are granted.
  /// Returns [true] if permission is granted, [false] otherwise.
  Future<bool> checkPermission();
  
  /// Shows a local notification immediately.
  /// [id] is a unique identifier for the notification.
  /// [title] is the notification title.
  /// [body] is the notification body text.
  /// [payload] is optional data to be passed with the notification.
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  });
  
  /// Schedules a local notification to be shown at a later time.
  /// [id] is a unique identifier for the notification.
  /// [title] is the notification title.
  /// [body] is the notification body text.
  /// [scheduledDate] is when the notification should be displayed.
  /// [payload] is optional data to be passed with the notification.
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  });
  
  /// Cancels a pending notification by its id.
  /// Returns [true] if cancellation is successful, [false] otherwise.
  Future<bool> cancelNotification(int id);
  
  /// Cancels all pending notifications.
  /// Returns [true] if cancellation is successful, [false] otherwise.
  Future<bool> cancelAllNotifications();
  
  /// Registers a callback to handle notification taps.
  /// The [onNotificationTap] callback provides the notification payload if available.
  void setOnNotificationTap(Function(String? payload) onNotificationTap);
  
  /// Gets the initial notification payload if the app was launched from a notification.
  /// Returns the payload as a string or [null] if not launched from notification.
  Future<String?> getInitialNotificationPayload();
}