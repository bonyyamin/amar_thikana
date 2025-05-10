// lib/presentation/providers/notification_provider.dart
import 'package:amar_thikana/data/datasources/remote/notification_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/notification.dart';
import '../../domain/usecases/get_notifications.dart';

import '../../data/repositories/notification_repository_impl.dart';

final notificationProvider = FutureProvider<List<Notification>>((ref) async {
  final remoteDataSource = NotificationRemoteDataSource();
  final repository = NotificationRepositoryImpl(remoteDataSource);
  final getNotifications = GetNotifications(repository);
  return await getNotifications();
});
