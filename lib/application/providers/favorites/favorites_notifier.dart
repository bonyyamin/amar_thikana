import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/property/property.dart';
import '../../use_cases/favorites/add_to_favorites_use_case.dart';
import '../../use_cases/favorites/get_favorites_use_case.dart';
import '../../use_cases/favorites/remove_from_favorites_use_case.dart';
import 'favorites_state.dart';

/// Notifier for managing favorites state and operations
class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final GetFavoritesUseCase _getFavoritesUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  FavoritesNotifier({
    required GetFavoritesUseCase getFavoritesUseCase,
    required AddToFavoritesUseCase addToFavoritesUseCase,
    required RemoveFromFavoritesUseCase removeFromFavoritesUseCase,
  })  : _getFavoritesUseCase = getFavoritesUseCase,
        _addToFavoritesUseCase = addToFavoritesUseCase,
        _removeFromFavoritesUseCase = removeFromFavoritesUseCase,
        super(FavoritesState.initial());

  /// Loads all favorite properties
  Future<void> loadFavorites() async {
    try {
      state = FavoritesState.loading();
      final favorites = await _getFavoritesUseCase.execute();
      state = FavoritesState.loaded(favorites);
    } catch (e) {
      state = FavoritesState.error('Failed to load favorites: ${e.toString()}');
    }
  }

  /// Adds a property to favorites
  Future<void> addToFavorites(Property property) async {
    try {
      final currentFavorites = List<Property>.from(state.favorites);
      
      // Check if property is already in favorites
      if (currentFavorites.any((p) => p.id == property.id)) {
        return; // Already added
      }
      
      // Update state optimistically
      state = state.copyWith(
        favorites: [...currentFavorites, property],
      );
      
      // Perform the actual operation
      final success = await _addToFavoritesUseCase.execute(property);
      
      if (!success) {
        // Revert on failure
        state = state.copyWith(
          favorites: currentFavorites,
          errorMessage: 'Failed to add to favorites',
        );
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Error adding to favorites: ${e.toString()}',
      );
    }
  }

  /// Removes a property from favorites
  Future<void> removeFromFavorites(String propertyId) async {
    try {
      final currentFavorites = List<Property>.from(state.favorites);
      final propertyIndex = currentFavorites.indexWhere((p) => p.id == propertyId);
      
      if (propertyIndex == -1) {
        return; // Property not in favorites
      }
      
      // Save the property in case we need to restore it
      final removedProperty = currentFavorites[propertyIndex];
      
      // Update state optimistically
      currentFavorites.removeAt(propertyIndex);
      state = state.copyWith(favorites: currentFavorites);
      
      // Perform the actual operation
      final success = await _removeFromFavoritesUseCase.execute(propertyId);
      
      if (!success) {
        // Revert on failure
        state = state.copyWith(
          favorites: [...currentFavorites]..insert(propertyIndex, removedProperty),
          errorMessage: 'Failed to remove from favorites',
        );
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Error removing from favorites: ${e.toString()}',
      );
    }
  }

  /// Checks if a property is in favorites
  bool isFavorite(String propertyId) {
    return state.favorites.any((property) => property.id == propertyId);
  }

  /// Clears the error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}