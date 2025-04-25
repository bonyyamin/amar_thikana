import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/favorites/favorites_provider.dart';
import 'package:amar_thikana/application/providers/property/properties_provider.dart';
import 'package:amar_thikana/presentation/screens/renter/favorites/widgets/favorite_property_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritePropertyIdsProvider);
    final propertiesAsync = ref.watch(propertiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Favorites')),
      body: propertiesAsync.when(
        data: (properties) {
          final favoriteProperties =
              properties
                  .where((property) => favoriteIds.contains(property.id))
                  .toList();

          if (favoriteProperties.isEmpty) {
            return const Center(child: Text('No favorites added yet.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteProperties.length,
            itemBuilder: (context, index) {
              final property = favoriteProperties[index];
              return FavoritePropertyCard(
                property: property,
                onCall: () {
                  // Add real phone logic if needed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Calling ${property.title}...')),
                  );
                },
                onDelete: () {
                  ref.read(favoritePropertyIdsProvider.notifier).update((list) {
                    return [...list]..remove(property.id);
                  });
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
