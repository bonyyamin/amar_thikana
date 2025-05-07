import 'package:dio/dio.dart';
import '../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
    
    if (options.queryParameters.isNotEmpty) {
      _logger.d('Request Query Parameters: ${options.queryParameters}');
    }
    
    if (options.data != null) {
      _logger.d('Request Body: ${options.data}');
    }
    
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    
    _logger.d('Response: ${response.data}');
    
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    
    if (err.response != null) {
      _logger.e('Error Response: ${err.response?.data}');
    } else {
      _logger.e('Error: ${err.message}');
    }
    
    return super.onError(err, handler);
  }
}