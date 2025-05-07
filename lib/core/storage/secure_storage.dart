import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Interface for secure storage operations
abstract class SecureStorage {
  /// Write value with key
  Future<void> write({required String key, required String value});
  
  /// Read value by key
  Future<String?> read({required String key});
  
  /// Delete value by key
  Future<void> delete({required String key});
  
  /// Delete all values
  Future<void> deleteAll();
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;
  
  // Default options
  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  SecureStorageImpl([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage(aOptions: _androidOptions);

  @override
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorageImpl();
});