import 'package:amar_thikana/core/errors/app_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../data/datasources/local/favorites_local_datasource.dart';
import '../../../domain/models/property/property.dart';

/// Use case responsible for adding a property to favorites
class AddToFavoritesUseCase {
  final FavoritesLocalDatasource _favoritesLocalDatasource;

  AddToFavoritesUseCase({
    required FavoritesLocalDatasource favoritesLocalDatasource,
  }) : _favoritesLocalDatasource = favoritesLocalDatasource;

  /// Executes the use case to add a property to favorites
  ///
  /// Takes a [Property] to be added to favorites
  /// Returns true if successful, throws a [Failure] in case of an error
 Future<bool> execute(Property property) async {
  try {
    final result = await _favoritesLocalDatasource.addToFavorites(property);
    return result;
  } on NetworkException catch (e) {
    throw NetworkFailure('Network error: ${e.message}');
  } on CacheException catch (e) {
    throw CacheFailure('Cache error: ${e.message}');
  } on ValidationException catch (e) {
    throw ValidationFailure('Validation failed', e.errors);
  } on PermissionException catch (e) {
    throw PermissionFailure('Permission denied: ${e.message}');
  } catch (e) {
    throw Failure('Unexpected error: ${e.toString()}');
  }
}
}

/// Provider for AddToFavoritesUseCase
final addToFavoritesUseCaseProvider = Provider<AddToFavoritesUseCase>((ref) {
  final favoritesLocalDatasource = ref.watch(favoritesLocalDatasourceProvider);
  return AddToFavoritesUseCase(
    favoritesLocalDatasource: favoritesLocalDatasource,
  );
});