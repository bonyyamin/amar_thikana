// lib/domain/usecases/get_notifications.dart
import 'package:amar_thikana/domain/repository/notification_repository.dart';

import '../entities/notification.dart';

class GetNotifications {
  final NotificationRepository repository;

  GetNotifications(this.repository);

  Future<List<Notification>> call() async {
    return await repository.fetchNotifications();
  }
}
