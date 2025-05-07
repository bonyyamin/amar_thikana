import 'package:amar_thikana/core/errors/app_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../../../data/datasources/local/favorites_local_datasource.dart';
import '../../../domain/models/property/property.dart';

/// Use case responsible for retrieving the user's favorite properties
class GetFavoritesUseCase {
  final FavoritesLocalDatasource _favoritesLocalDatasource;

  GetFavoritesUseCase({
    required FavoritesLocalDatasource favoritesLocalDatasource,
  }) : _favoritesLocalDatasource = favoritesLocalDatasource;

  /// Executes the use case to get all favorite properties
  ///
  /// Returns a [List<Property>] containing all the user's favorite properties
  /// or throws a [Failure] in case of an error
Future<List<Property>> execute() async {
  try {
    final favorites = await _favoritesLocalDatasource.getFavorites();
    return favorites;
  } on CacheException catch (e) {
    throw CacheFailure('Cache error: ${e.message}');
  } on NetworkException catch (e) {
    throw NetworkFailure('Network issue: ${e.message}');
  } catch (e) {
    throw Failure('Unexpected error: ${e.toString()}');
  }
}

}

/// Provider for GetFavoritesUseCase
final getFavoritesUseCaseProvider = Provider<GetFavoritesUseCase>((ref) {
  final favoritesLocalDatasource = ref.watch(favoritesLocalDatasourceProvider);
  return GetFavoritesUseCase(
    favoritesLocalDatasource: favoritesLocalDatasource,
  );
});