import 'package:amar_thikana/application/providers/network_info_provider.dart';

import 'package:amar_thikana/data/repositories/property_repository.dart';
import 'package:amar_thikana/data/services/provider/storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/repository/property_repository_interface.dart';

/// Provider for `PropertyRepositoryInterface`
final propertyRepositoryProvider = Provider<PropertyRepositoryInterface>((ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  final storageService = ref.watch(storageServiceProvider);
  final remoteDataSource = ref.watch(remoteDataSourceProvider);

  return PropertyRepository(
    networkInfo,
    storageService,  // Ensure correct dependency type
    remoteDataSource, // Ensure correct dependency type
  );
});