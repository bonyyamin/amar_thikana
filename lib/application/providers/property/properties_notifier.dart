import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/property/properties_state.dart';

class PropertiesNotifier extends StateNotifier<PropertiesState> {
  PropertiesNotifier() : super(const PropertiesState.initial()) {
    getProperties();
  }

  Future<void> getProperties() async {
    try {
      state = const PropertiesState.loading();
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Dummy Properties List
      final List<Property> properties = [
        Property(
          id: '1',
          title: 'Duplex Apartment',
          description: 'Beautiful duplex with modern amenities.',
          coverImage: 'https://via.placeholder.com/150',
          location: const Location(city: 'Stockton', state: 'New Hampshire', country: 'USA'),
          pricePerMonth: 1495,
          rating: 4.8,
          reviewsCount: 256,
          bedrooms: 5,
          bathrooms: 2,
          parkingSpaces: 1,
          type: PropertyType.apartment,
        ),
        Property(
          id: '2',
          title: 'Modern House',
          description: 'Spacious house with private garden.',
          coverImage: 'https://via.placeholder.com/150',
          location: const Location(city: 'Los Angeles', state: 'California', country: 'USA'),
          pricePerMonth: 2499,
          rating: 4.7,
          reviewsCount: 310,
          bedrooms: 4,
          bathrooms: 3,
          parkingSpaces: 2,
          type: PropertyType.house,
        ),
      ];

      state = PropertiesState.loaded(properties);
    } catch (e) {
      state = PropertiesState.error('Failed to fetch properties');
    }
  }
}
