import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

final propertyListProvider =
    StateNotifierProvider<PropertyListNotifier, AsyncValue<List<Property>>>(
      (ref) => PropertyListNotifier(),
    );

class PropertyListNotifier extends StateNotifier<AsyncValue<List<Property>>> {
  PropertyListNotifier() : super(const AsyncValue.loading()) {
    loadProperties();
  }

  Future<void> loadProperties() async {
    try {
      state = const AsyncValue.loading();
      // TODO: Replace with actual API call
      final List<Property> properties = [];
      // Sort by newest first
      properties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = AsyncValue.data(properties);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addProperty(Property property) async {
    try {
      state.whenData((properties) {
        final updatedProperties = [...properties, property];
        // Sort by newest first
        updatedProperties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = AsyncValue.data(updatedProperties);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateProperty(Property property) async {
    try {
      state.whenData((properties) {
        final updatedProperties =
            properties
                .map(
                  (p) =>
                      p.id == property.id
                          ? property.copyWith(updatedAt: DateTime.now())
                          : p,
                )
                .toList();
        // Sort by newest first
        updatedProperties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        state = AsyncValue.data(updatedProperties);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteProperty(String propertyId) async {
    try {
      state.whenData((properties) {
        final updatedProperties =
            properties.where((p) => p.id != propertyId).toList();
        state = AsyncValue.data(updatedProperties);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Property? getPropertyById(String id) {
    return state.value?.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Property not found'),
    );
  }
}
