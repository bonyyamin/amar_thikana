import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/app_config.dart';
import '../errors/app_exceptions.dart';
import '../storage/secure_storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

abstract class IApiClient {
  Future<Map<String, dynamic>> getRequest(String endpoint);
  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> body);
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options});
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options});
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options});
  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options});
}

class ApiClient implements IApiClient {
  final Dio _dio;
  final SecureStorage _secureStorage;
  final AppConfig _appConfig;

  ApiClient({
    required Dio dio,
    required SecureStorage secureStorage,
    required AppConfig appConfig, required String baseUrl,
  })  : _dio = dio,
        _secureStorage = secureStorage,
        _appConfig = appConfig {
    _init();
  }

  void _init() {
    _dio.options = BaseOptions(
      baseUrl: _appConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      validateStatus: (status) {
        return status != null && status < 500;
      },
    );

    _dio.interceptors.add(AuthInterceptor(_secureStorage));
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('${_appConfig.apiBaseUrl}$endpoint'));
      return _processHttpResponse(response);
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> postRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('${_appConfig.apiBaseUrl}$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      return _processHttpResponse(response);
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  Map<String, dynamic> _processHttpResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options}) async {
    return await _handleDioRequest(() => _dio.get(path, queryParameters: queryParameters, options: _mergeOptions(options, headers)));
  }

  @override
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options}) async {
    return await _handleDioRequest(() => _dio.post(path, data: data, queryParameters: queryParameters, options: _mergeOptions(options, headers)));
  }

  @override
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options}) async {
    return await _handleDioRequest(() => _dio.put(path, data: data, queryParameters: queryParameters, options: _mergeOptions(options, headers)));
  }

  @override
  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers, Options? options}) async {
    return await _handleDioRequest(() => _dio.delete(path, data: data, queryParameters: queryParameters, options: _mergeOptions(options, headers)));
  }

  Future<Response> _handleDioRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException('An unexpected error occurred', 500);
    }
  }

  Options? _mergeOptions(Options? options, Map<String, dynamic>? headers) {
    return headers == null ? options : (options ?? Options()).copyWith(headers: headers);
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException('Connection timeout', 408);
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 500;
        final message = e.response?.data?['message'] ?? 'Server error';
        return ServerException(message, statusCode);
      case DioExceptionType.cancel:
        return ServerException('Request canceled', 499);
      case DioExceptionType.connectionError:
        return ServerException('Connection error', 503);
      case DioExceptionType.unknown:
      default:
        return ServerException('Unknown error', 500);
    }
  }
}

final apiClientProvider = Provider<IApiClient>((ref) {
  final dio = Dio();
  final secureStorage = ref.watch(secureStorageProvider);
  final appConfig = ref.watch(appConfigProvider);

  return ApiClient(
    dio: dio,
    secureStorage: secureStorage,
    appConfig: appConfig, baseUrl: appConfig.apiBaseUrl,
  );
});