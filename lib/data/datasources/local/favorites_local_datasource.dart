import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/local_storage.dart';
import '../../../domain/models/property/property.dart';

class FavoritesLocalDatasource {
  final LocalStorage _localStorage;
  static const String _favoritesKey = 'user_favorites';

  FavoritesLocalDatasource({required LocalStorage localStorage})
      : _localStorage = localStorage;

  /// Retrieves all favorite properties from local storage
  Future<List<Property>> getFavorites() async {
    try {
      final favoritesJson = await _localStorage.getData(_favoritesKey);
      
      if (favoritesJson == null) {
        return [];
      }

      final List<dynamic> favoritesList = jsonDecode(favoritesJson);
      return favoritesList
          .map((propertyJson) => Property.fromJson(propertyJson))
          .toList();
    } catch (e) {
      debugPrint('Error fetching favorites: $e');
      return [];
    }
  }

  /// Saves a property to favorites
  Future<bool> addToFavorites(Property property) async {
    try {
      final currentFavorites = await getFavorites();
      
      // Check if property is already in favorites
      if (currentFavorites.any((p) => p.id == property.id)) {
        return true; // Already added
      }
      
      final updatedFavorites = [...currentFavorites, property];
      final favoritesJson = jsonEncode(
          updatedFavorites.map((property) => property.toJson()).toList());
      
      await _localStorage.saveData(_favoritesKey, favoritesJson);
      return true;
    } catch (e) {
      debugPrint('Error adding to favorites: $e');
      return false;
    }
  }

  /// Removes a property from favorites
  Future<bool> removeFromFavorites(String propertyId) async {
    try {
      final currentFavorites = await getFavorites();
      final updatedFavorites = currentFavorites
          .where((property) => property.id != propertyId)
          .toList();
      
      final favoritesJson = jsonEncode(
          updatedFavorites.map((property) => property.toJson()).toList());
      
      await _localStorage.saveData(_favoritesKey, favoritesJson);
      return true;
    } catch (e) {
      debugPrint('Error removing from favorites: $e');
      return false;
    }
  }

  /// Checks if a property is in favorites
  Future<bool> isFavorite(String propertyId) async {
    try {
      final favorites = await getFavorites();
      return favorites.any((property) => property.id == propertyId);
    } catch (e) {
      debugPrint('Error checking favorite status: $e');
      return false;
    }
  }

  /// Clears all favorites
  Future<bool> clearFavorites() async {
    try {
      await _localStorage.removeData(_favoritesKey);
      return true;
    } catch (e) {
      debugPrint('Error clearing favorites: $e');
      return false;
    }
  }
}

final favoritesLocalDatasourceProvider = Provider<FavoritesLocalDatasource>(
  (ref) {
    final localStorage = ref.watch(localStorageProvider);
    return FavoritesLocalDatasource(localStorage: localStorage);
  },
);

// This assumes you have a provider for LocalStorage
final localStorageProvider = Provider<LocalStorage>((ref) {
  return LocalStorage();
});