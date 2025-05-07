import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'environment_config.dart';

class AppConfig {
  final String apiBaseUrl;
  final String appName;
  final bool debugMode;
  
  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.debugMode,
  });
  
  factory AppConfig.development() {
    return const AppConfig(
      apiBaseUrl: 'https://dev-api.yourrealestateapp.com/api/v1',
      appName: 'Your Real Estate App (Dev)',
      debugMode: true,
    );
  }
  
  factory AppConfig.staging() {
    return const AppConfig(
      apiBaseUrl: 'https://staging-api.yourrealestateapp.com/api/v1',
      appName: 'Your Real Estate App (Staging)',
      debugMode: true,
    );
  }
  
  factory AppConfig.production() {
    return const AppConfig(
      apiBaseUrl: 'https://api.yourrealestateapp.com/api/v1',
      appName: 'Your Real Estate App',
      debugMode: false,
    );
  }
  
  factory AppConfig.fromEnvironment(Environment environment) {
    switch (environment) {
      case Environment.development:
        return AppConfig.development();
      case Environment.staging:
        return AppConfig.staging();
      case Environment.production:
        return AppConfig.production();
    }
  }
}

final appConfigProvider = Provider<AppConfig>((ref) {
  final environment = ref.watch(environmentProvider);
  return AppConfig.fromEnvironment(environment);
});