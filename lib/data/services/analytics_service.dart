import 'package:amar_thikana/domain/services/analytics_service_interface.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsService implements AnalyticsServiceInterface {
  static final AnalyticsService _instance = AnalyticsService._internal();

  factory AnalyticsService() {
    return _instance;
  }

  AnalyticsService._internal();

  late FirebaseAnalytics _analytics;
  bool _isEnabled = true;

  @override
  Future<bool> initialize() async {
    try {
      _analytics = FirebaseAnalytics.instance;

      // Set analytics collection enabled state
      await _analytics.setAnalyticsCollectionEnabled(_isEnabled);

      return true;
    } catch (e) {
      debugPrint('Error initializing analytics service: $e');
      return false;
    }
  }

  @override
  Future<void> logEvent({
    required String eventName,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_isEnabled) return;

    try {
      // Convert parameters to Firebase-compatible format if needed
      Map<String, Object>? firebaseParams;

      if (parameters != null) {
        firebaseParams = <String, Object>{};
        parameters.forEach((key, value) {
          // Firebase Analytics only accepts certain types
          if (value is String ||
              value is num ||
              value is bool ||
              value is List<String>) {
            firebaseParams![key] = value;
          } else if (value != null) {
            // Convert to string if not a supported type
            firebaseParams![key] = value.toString();
          }
        });
      }

      await _analytics.logEvent(
        name: _sanitizeEventName(eventName),
        parameters: firebaseParams,
      );
    } catch (e) {
      debugPrint('Error logging event: $e');
    }
  }

  @override
  Future<void> setUserProperties(UserProperties properties) async {
    if (!_isEnabled) return;

    try {
      // Set user ID if provided
      if (properties.userId != null) {
        await setUserId(properties.userId!);
      }

      // Set custom user properties
      for (final entry in properties.properties.entries) {
        await _analytics.setUserProperty(
          name: entry.key,
          value: _convertToString(entry.value),
        );
      }
    } catch (e) {
      debugPrint('Error setting user properties: $e');
    }
  }

  @override
  Future<void> setUserId(String userId) async {
    if (!_isEnabled) return;

    try {
      await _analytics.setUserId(id: userId);
    } catch (e) {
      debugPrint('Error setting user ID: $e');
    }
  }

  @override
  Future<void> resetUser() async {
    if (!_isEnabled) return;

    try {
      await _analytics.setUserId(id: null);
    } catch (e) {
      debugPrint('Error resetting user: $e');
    }
  }

  @override
  Future<bool> enable() async {
    try {
      _isEnabled = true;
      await _analytics.setAnalyticsCollectionEnabled(true);
      return true;
    } catch (e) {
      debugPrint('Error enabling analytics: $e');
      return false;
    }
  }

  @override
  Future<bool> disable() async {
    try {
      _isEnabled = false;
      await _analytics.setAnalyticsCollectionEnabled(false);
      return true;
    } catch (e) {
      debugPrint('Error disabling analytics: $e');
      return false;
    }
  }

  @override
  Future<bool> isEnabled() async {
    return _isEnabled;
  }

  @override
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    if (!_isEnabled) return;

    try {
      await _analytics.logScreenView(
        screenName: screenName,
        screenClass: screenClass ?? 'Flutter',
      );
    } catch (e) {
      debugPrint('Error logging screen view: $e');
    }
  }

  @override
  Future<void> logError({
    required dynamic error,
    StackTrace? stackTrace,
    bool fatal = false,
  }) async {
    if (!_isEnabled) return;

    try {
      await _analytics.logEvent(
        name: 'app_exception',
        parameters: {
          'error': error.toString(),
          'stack_trace': stackTrace?.toString() ?? 'No stack trace',
          'fatal': fatal,
        },
      );
    } catch (e) {
      debugPrint('Error logging error event: $e');
    }
  }

  @override
  Future<void> flushEvents() async {
    if (!_isEnabled) return;

    // Firebase Analytics automatically flushes events periodically,
    // but there's no direct API to force flush at the moment.
    // This method is included for interface compatibility.
  }

  // Helper method to sanitize event names according to Firebase requirements
  String _sanitizeEventName(String eventName) {
    // Firebase event names must be <= 40 characters and contain only
    // alphanumeric characters and underscores
    final sanitized = eventName
        .replaceAll(RegExp(r'[^a-zA-Z0-9_]'), '_')
        .replaceAll(RegExp(r'__+'), '_');

    return sanitized.length > 40 ? sanitized.substring(0, 40) : sanitized;
  }

  // Helper method to convert any value to a string safely
  String? _convertToString(dynamic value) {
    if (value == null) {
      return null;
    }
    return value.toString();
  }
}
