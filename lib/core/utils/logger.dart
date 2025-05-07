import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as logger_pkg;
import '../config/app_config.dart';

/// Custom logger for the app
class Logger {
  static final Logger _instance = Logger._internal();
  late logger_pkg.Logger _logger;

  factory Logger() {
    return _instance;
  }

  Logger._internal() {
    _logger = logger_pkg.Logger(
      printer: logger_pkg.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: logger_pkg.DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: kDebugMode ? logger_pkg.Level.trace : logger_pkg.Level.warning,
    );
  }

  /// Initialize logger with config
  void init(AppConfig config) {
    _logger = logger_pkg.Logger(
      printer: logger_pkg.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: logger_pkg.DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level:
          config.debugMode ? logger_pkg.Level.trace : logger_pkg.Level.warning,
    );
  }

  /// Log a trace message (replaces verbose)
  void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.trace,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a debug message
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.debug,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log an info message
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.info,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a warning message
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.warning,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log an error message
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.error,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a fatal message (replaces wtf)
  void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.log(
      logger_pkg.Level.fatal,
      message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
