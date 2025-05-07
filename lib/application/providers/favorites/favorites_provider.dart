import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/property/property.dart';
import '../../use_cases/favorites/add_to_favorites_use_case.dart';
import '../../use_cases/favorites/get_favorites_use_case.dart';
import '../../use_cases/favorites/remove_from_favorites_use_case.dart';
import 'favorites_notifier.dart';
import 'favorites_state.dart';

/// StateNotifierProvider for favorites functionality
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
  final getFavoritesUseCase = ref.watch(getFavoritesUseCaseProvider);
  final addToFavoritesUseCase = ref.watch(addToFavoritesUseCaseProvider);
  final removeFromFavoritesUseCase = ref.watch(removeFromFavoritesUseCaseProvider);

  return FavoritesNotifier(
    getFavoritesUseCase: getFavoritesUseCase,
    addToFavoritesUseCase: addToFavoritesUseCase,
    removeFromFavoritesUseCase: removeFromFavoritesUseCase,
  );
});

/// A convenience provider that returns just the favorites list
final favoritesListProvider = Provider<List<Property>>((ref) {
  return ref.watch(favoritesProvider).favorites;
});

/// A provider to check if a property is favorited
final isFavoriteProvider = Provider.family<bool, String>((ref, propertyId) {
  final favorites = ref.watch(favoritesListProvider);
  return favorites.any((property) => property.id == propertyId);
});

/// A provider that returns the count of favorites
final favoritesCountProvider = Provider<int>((ref) {
  return ref.watch(favoritesListProvider).length;
});

/// A provider that returns true if favorites are loading
final favoritesLoadingProvider = Provider<bool>((ref) {
  return ref.watch(favoritesProvider).isLoading;
});

/// A provider that returns the error message if any
final favoritesErrorProvider = Provider<String?>((ref) {
  return ref.watch(favoritesProvider).errorMessage;
});