import 'package:amar_thikana/core/config/app_config.dart';
import 'package:amar_thikana/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';

// Define the API client provider
final apiClientProvider = Provider<ApiClient>((ref) {
  final dio = Dio();
  final secureStorage = ref.watch(secureStorageProvider);
  final appConfig = ref.watch(appConfigProvider);

  return ApiClient(
    baseUrl: 'https://api.example.com',
    dio: dio,
    secureStorage: secureStorage,
    appConfig: appConfig,
  );
});