import 'package:amar_thikana/application/providers/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/favorites/favorites_provider.dart';
import 'package:amar_thikana/presentation/screens/renter/favorites/widgets/favorite_property_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the favorites list directly using the existing provider
    final favoritesState = ref.watch(favoritesProvider);
    final favorites = favoritesState.favorites;
    final isLoading = favoritesState.isLoading;
    final errorMessage = favoritesState.errorMessage;

    // Load favorites when the screen is first built
    ref.listen<FavoritesState>(favoritesProvider, (previous, current) {
      // Handle state changes if needed
      if (previous?.errorMessage != current.errorMessage && 
          current.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(current.errorMessage!)),
        );
      }
    });

    // Initialize loading of favorites
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Only load if not already loading and not already loaded
      if (!isLoading && favorites.isEmpty && errorMessage == null) {
        ref.read(favoritesProvider.notifier).loadFavorites();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Your Favorites')),
      body: isLoading 
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null && favorites.isEmpty
              ? Center(child: Text('Error: $errorMessage'))
              : _buildFavoritesList(context, ref, favorites),
    );
  }

  Widget _buildFavoritesList(BuildContext context, WidgetRef ref, List favorites) {
    if (favorites.isEmpty) {
      return const Center(child: Text('No favorites added yet.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final property = favorites[index];
        return FavoritePropertyCard(
          property: property,
          onCall: () {
            // Add real phone logic if needed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Calling ${property.title}...')),
            );
          },
          onDelete: () {
            // Use the notifier from favoritesProvider to remove from favorites
            ref.read(favoritesProvider.notifier).removeFromFavorites(property.id);
          },
        );
      },
    );
  }
}