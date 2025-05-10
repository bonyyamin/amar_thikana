import 'package:amar_thikana/data/datasources/remote/notification_remote_data_source.dart';
import 'package:amar_thikana/domain/repository/notification_repository.dart';
import '../../domain/entities/notification.dart';


class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Notification>> fetchNotifications() async {
    return await remoteDataSource.getNotifications();
  }
}
