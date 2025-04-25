import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

final propertiesProvider = FutureProvider<List<Property>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));

  return [
    Property(
      id: '1',
      title: '3 Room Apartment in Dhanmondi',
      description:
          'Beautiful and spacious apartment with modern amenities, fully furnished, 24/7 security, and parking space.',
      coverImage: 'https://picsum.photos/200/300',
      location: const Location(
        city: 'Dhanmondi',
        state: 'Dhaka',
        country: 'Bangladesh',
      ),
      pricePerMonth: 25000,
      rating: 4.8,
      reviewsCount: 256,
      bedrooms: 3,
      bathrooms: 2,
      parkingSpaces: 1,
      type: PropertyType.apartment,
    ),
    Property(
      id: '2',
      title: 'Single Room in Mohammadpur',
      description:
          'Cozy single room perfect for students, near BUET. Includes Wi-Fi and basic furnishing.',
      coverImage: 'https://picsum.photos/200/301',
      location: const Location(
        city: 'Mohammadpur',
        state: 'Dhaka',
        country: 'Bangladesh',
      ),
      pricePerMonth: 8000,
      rating: 4.5,
      reviewsCount: 128,
      bedrooms: 1,
      bathrooms: 1,
      parkingSpaces: 0,
      type: PropertyType.room,
    ),
    Property(
      id: '3',
      title: 'Bachelor Building in Uttara',
      description:
          'Exclusive bachelor building with shared facilities, generator, and high-speed internet.',
      coverImage: 'https://picsum.photos/200/302',
      location: const Location(
        city: 'Uttara',
        state: 'Dhaka',
        country: 'Bangladesh',
      ),
      pricePerMonth: 15000,
      rating: 4.7,
      reviewsCount: 89,
      bedrooms: 2,
      bathrooms: 1,
      parkingSpaces: 1,
      type: PropertyType.building,
    ),
  ];
});
