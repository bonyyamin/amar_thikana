import 'package:amar_thikana/domain/entities/notification.dart';

class NotificationRemoteDataSource {
  Future<List<Notification>> getNotifications() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Simulated fetched data
    return [
      Notification(
        id: '1',
        title: 'Welcome',
        message: 'Thank you for joining us!',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      Notification(
        id: '2',
        title: 'Update Available',
        message: 'A new update is available. Please update the app.',
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ];
  }
}
