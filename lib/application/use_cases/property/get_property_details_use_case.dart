import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/network_info_provider.dart' as providers;
import 'package:amar_thikana/application/providers/property/property_repository_provider.dart';
import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/domain/repository/property_repository_interface.dart';
import 'package:amar_thikana/core/network/network_info.dart';

class GetPropertyDetailsUseCase {
  final PropertyRepositoryInterface _repository;
  final NetworkInfo _networkInfo;

  GetPropertyDetailsUseCase(this._repository, this._networkInfo);

  /// Fetches detailed information about a specific property
  Future<Property> execute(String propertyId) async {
    if (propertyId.isEmpty) {
      throw Failure('Property ID cannot be empty');
    }

    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      final cached = await _repository.getPropertyFromCache(propertyId);
      if (cached != null) return cached;
      throw Failure('No internet connection and no cached data available');
    }

    final remote = await _repository.getPropertyDetails(propertyId);
    if (remote == null) {
      throw Failure('Property not found on server');
    }

    await _repository.cachePropertyDetails(remote);
    return remote;
  }
}

final getPropertyDetailsUseCaseProvider =
    Provider<GetPropertyDetailsUseCase>((ref) {
  final repo = ref.watch(propertyRepositoryProvider);
  final networkInfo = ref.watch(providers.networkInfoProvider);
  return GetPropertyDetailsUseCase(repo, networkInfo);
});