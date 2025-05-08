import 'package:amar_thikana/domain/services/notification_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService implements NotificationServiceInterface {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Function(String? payload)? _onNotificationTap;

  @override
  Future<bool> initialize() async {
    try {
      // Initialize timezone
      tz.initializeTimeZones();

      // Android initialization settings
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      // iOS initialization settings
      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
          );

      // Initialization settings for both platforms
      const InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          );

      // Initialize the plugin
      await _notificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          if (_onNotificationTap != null) {
            _onNotificationTap!(response.payload);
          }
        },
      );

      return true;
    } catch (e) {
      debugPrint('Error initializing notification service: $e');
      return false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    try {
      // Request permission for iOS
      final bool? result = await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);

      // For Android, permissions are handled in the AndroidManifest.xml
      return result ?? true;
    } catch (e) {
      debugPrint('Error requesting notification permission: $e');
      return false;
    }
  }

  @override
  Future<bool> checkPermission() async {
    try {
      // Check permission for iOS
      final bool? result = await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.pendingNotificationRequests()
          .then((_) => true)
          .catchError((_) => false);

      // For Android, permissions are set in the AndroidManifest.xml
      return result ?? true;
    } catch (e) {
      debugPrint('Error checking notification permission: $e');
      return false;
    }
  }

  @override
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      // Android notification details
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
            'your_channel_id', // Channel ID
            'your_channel_name', // Channel name
            channelDescription: 'your_channel_description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
          );

      // iOS notification details
      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          );

      // Notification details for both platforms
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );

      // Show the notification
      await _notificationsPlugin.show(
        id,
        title,
        body,
        platformChannelSpecifics,
        payload: payload,
      );
    } catch (e) {
      debugPrint('Error showing notification: $e');
    }
  }

  @override
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
  }) async {
    try {
      // Android notification details
      // You can customize the channel ID, name, and description as needed
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
            'your_channel_id',
            'your_channel_name',
            channelDescription: 'your_channel_description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
          );

      // iOS notification details
      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          );

      // Notification details for both platforms
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );

      // Schedule the notification
      await _notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledDate, tz.local),
        platformChannelSpecifics,

        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
      );
    } catch (e) {
      debugPrint('Error scheduling notification: $e');
    }
  }

  @override
  Future<bool> cancelNotification(int id) async {
    try {
      await _notificationsPlugin.cancel(id);
      return true;
    } catch (e) {
      debugPrint('Error canceling notification: $e');
      return false;
    }
  }

  @override
  Future<bool> cancelAllNotifications() async {
    try {
      await _notificationsPlugin.cancelAll();
      return true;
    } catch (e) {
      debugPrint('Error canceling all notifications: $e');
      return false;
    }
  }

  @override
  void setOnNotificationTap(Function(String? payload) onNotificationTap) {
    _onNotificationTap = onNotificationTap;
  }

  @override
  Future<String?> getInitialNotificationPayload() async {
    try {
      final NotificationAppLaunchDetails? notificationAppLaunchDetails =
          await _notificationsPlugin.getNotificationAppLaunchDetails();

      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        return notificationAppLaunchDetails?.notificationResponse?.payload;
      }

      return null;
    } catch (e) {
      debugPrint('Error getting initial notification payload: $e');
      return null;
    }
  }
}
