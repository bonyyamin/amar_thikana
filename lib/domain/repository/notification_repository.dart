// lib/domain/repositories/notification_repository.dart
import '../entities/notification.dart';

abstract class NotificationRepository {
  Future<List<Notification>> fetchNotifications();
}
