// lib/domain/entities/notification.dart
class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
  });
}
