import 'package:amar_thikana/data/datasources/local/property_local_datasource.dart';
import 'package:amar_thikana/data/datasources/remote/property_remote_datasource.dart';
import 'package:amar_thikana/data/repositories/property_repository.dart';
import 'package:amar_thikana/data/services/storage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/network_info.dart';

/// Provider for `NetworkInfo`
final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfo(Connectivity()),
);

/// Provider for `PropertyLocalDataSource`
final localDataSourceProvider = Provider<PropertyLocalDataSource>(
  (ref) => PropertyLocalDataSource(),
);

/// Provider for `PropertyRemoteDataSource`
final remoteDataSourceProvider = Provider<PropertyRemoteDataSource>(
  (ref) => PropertyRemoteDataSource(
    

  ),
);

/// Provider for `PropertyRepository`
final propertyRepositoryProvider = Provider<PropertyRepository>(
  (ref) => PropertyRepository(
    ref.read(localDataSourceProvider as ProviderListenable<PropertyRemoteDataSource>),
    ref.read(remoteDataSourceProvider as ProviderListenable<PropertyLocalDataSource>),
    ref.read(networkInfoProvider as ProviderListenable<StorageService>),
  ),
);