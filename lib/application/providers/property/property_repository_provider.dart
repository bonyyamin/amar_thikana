import 'package:amar_thikana/application/providers/network_info_provider.dart';
import 'package:amar_thikana/data/repositories/property_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repository/property_repository_interface.dart';

/// Provider for `PropertyRepositoryInterface`
final propertyRepositoryProvider = Provider<PropertyRepositoryInterface>((ref) {
  final remoteDataSource = ref.watch(remoteDataSourceProvider);
  final localDataSource = ref.watch(localDataSourceProvider);
  final storageService = ref.watch(storageServiceProvider);

  return PropertyRepository(
    remoteDataSource,
    localDataSource,
    storageService,
  );
});