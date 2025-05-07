import 'package:amar_thikana/core/errors/app_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../data/datasources/local/favorites_local_datasource.dart';

/// Use case responsible for removing a property from favorites
class RemoveFromFavoritesUseCase {
  final FavoritesLocalDatasource _favoritesLocalDatasource;

  RemoveFromFavoritesUseCase({
    required FavoritesLocalDatasource favoritesLocalDatasource,
  }) : _favoritesLocalDatasource = favoritesLocalDatasource;

  /// Executes the use case to remove a property from favorites
  ///
  /// Takes a [String] propertyId to identify the property to be removed
  /// Returns true if successful, throws a [Failure] in case of an error
Future<bool> execute(String propertyId) async {
  try {
    final result = await _favoritesLocalDatasource.removeFromFavorites(propertyId);
    return result;
  } on CacheException catch (e) {
    throw CacheFailure('Cache error: ${e.message}');
  } on NetworkException catch (e) {
    throw NetworkFailure('Network issue: ${e.message}');
  } on PermissionException catch (e) {
    throw PermissionFailure('Permission denied: ${e.message}');
  } catch (e) {
    throw Failure('Unexpected error: ${e.toString()}');
  }
}
}

/// Provider for RemoveFromFavoritesUseCase
final removeFromFavoritesUseCaseProvider = Provider<RemoveFromFavoritesUseCase>((ref) {
  final favoritesLocalDatasource = ref.watch(favoritesLocalDatasourceProvider);
  return RemoveFromFavoritesUseCase(
    favoritesLocalDatasource: favoritesLocalDatasource,
  );
});