import 'package:amar_thikana/data/datasources/local/property_local_datasource.dart';
import 'package:amar_thikana/data/datasources/remote/property_remote_datasource.dart';
import 'package:amar_thikana/data/services/storage_service.dart';
import 'package:amar_thikana/data/services/firebase_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/network/network_info.dart';

/// Provider for `NetworkInfo`
final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfo(Connectivity()),
);

/// Provider for `PropertyLocalDataSource`
final localDataSourceProvider = Provider<PropertyLocalDataSource>(
  (ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return PropertyLocalDataSource(sharedPreferences);
  },
);

/// Provider for `PropertyRemoteDataSource`
final remoteDataSourceProvider = Provider<PropertyRemoteDataSource>(
  (ref) {
    final firebaseService = ref.watch(firebaseServiceProvider);
    return PropertyRemoteDataSource(firebaseService);
  },
);

/// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Initialize SharedPreferences in main.dart before use'),
);

/// Provider for FirebaseService
final firebaseServiceProvider = Provider<FirebaseService>(
  (ref) => FirebaseService(ref.watch(firebaseFirestoreProvider)),
);

/// Provider for Firebase Firestore
final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

/// Provider for `StorageService`
final storageServiceProvider = Provider<StorageService>(
  (ref) => StorageService(), // Assuming you have a default constructor
);