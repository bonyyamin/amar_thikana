import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Environment {
  development,
  staging,
  production,
}

final environmentProvider = Provider<Environment>((ref) {
  // This should be set based on build configuration
  // For now, default to development
  return Environment.development;
});