import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/property/properties_state.dart';

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
      final now = DateTime.now();
      // Mock data with all required fields
      final List<Property> properties = [
        Property(
          id: '1',
          title: 'Sample Property',
          pricePerMonth: 15000,
          type: PropertyType.apartment,
          amenities: ['WiFi', 'AC'],
          rules: ['No Pets'],
          photos: ['https://picsum.photos/200'],
          ownerId: 'owner123',
          createdAt: now,
          updatedAt: now,
        ),
        // Add more mock properties as needed
      ];
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
        // No need to sort after deletion since relative order remains the same
        state = AsyncValue.data(updatedProperties);
      });
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Property? getPropertyById(String id) {
    return state
        .whenData(
          (properties) => properties.firstWhere(
            (p) => p.id == id,
            orElse: () => throw Exception('Property not found'),
          ),
        )
        .value;
  }
}

class PropertiesNotifier extends StateNotifier<PropertiesState> {
  PropertiesNotifier() : super(const PropertiesState.initial()) {
    getProperties();
  }

  Future<void> getProperties() async {
    try {
      state = const PropertiesState.loading();
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      final now = DateTime.now();

      // Dummy Properties List
      final List<Property> properties = [
        Property(
          id: '1',
          title: 'Duplex Apartment',
          description: 'Beautiful duplex with modern amenities.',
          coverImage: 'https://via.placeholder.com/150',
          location: const Location(
            city: 'Stockton',
            state: 'New Hampshire',
            country: 'USA',
          ),
          pricePerMonth: 1495,
          rating: 4.8,
          reviewsCount: 256,
          bedrooms: 5,
          bathrooms: 2,
          parkingSpaces: 1,
          type: PropertyType.apartment,
          amenities: ['WiFi', 'AC', 'Parking', 'Generator'],
          rules: ['No Smoking', 'Family Only'],
          photos: [
            'https://via.placeholder.com/150',
            'https://via.placeholder.com/150',
          ],
          ownerId: 'owner123',
          createdAt: now,
          updatedAt: now,
        ),
        Property(
          id: '2',
          title: 'Modern House',
          description: 'Spacious house with private garden.',
          coverImage: 'https://via.placeholder.com/150',
          location: const Location(
            city: 'Los Angeles',
            state: 'California',
            country: 'USA',
          ),
          pricePerMonth: 2499,
          rating: 4.7,
          reviewsCount: 310,
          bedrooms: 4,
          bathrooms: 3,
          parkingSpaces: 2,
          type: PropertyType.house,
          amenities: ['WiFi', 'AC', 'Garden', 'Pool'],
          rules: ['No Pets', 'No Parties'],
          photos: [
            'https://via.placeholder.com/150',
            'https://via.placeholder.com/150',
          ],
          ownerId: 'owner456',
          createdAt: now,
          updatedAt: now,
        ),
      ];

      state = PropertiesState.loaded(properties);
    } catch (e) {
      state = PropertiesState.error('Failed to fetch properties');
    }
  }
}
