import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';


final propertiesProvider = FutureProvider<List<Property>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));

  final now = DateTime.now();
  final oneWeekAgo = now.subtract(const Duration(days: 7));
  

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
      amenities: ['WiFi', 'AC', 'Parking', 'Generator', '24/7 Security'],
      rules: ['No Smoking', 'Family Only', 'No Pets'],
      photos: [
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/301',
        'https://picsum.photos/200/302',
      ],
      ownerId: 'owner123',
      createdAt: oneWeekAgo,
      updatedAt: now,
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
      amenities: ['WiFi', 'Water Supply', 'Basic Furniture'],
      rules: ['Students Only', 'No Parties', 'Bachelor Allowed'],
      photos: [
        'https://picsum.photos/200/301',
        'https://picsum.photos/200/302',
      ],
      ownerId: 'owner456',
      createdAt: oneWeekAgo,
      updatedAt: now,
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
      amenities: ['Generator', 'High-Speed WiFi', 'Laundry', 'CCTV'],
      rules: ['Bachelor Only', 'No Smoking', 'No Pets'],
      photos: [
        'https://picsum.photos/200/302',
        'https://picsum.photos/200/303',
        'https://picsum.photos/200/304',
      ],
      ownerId: 'owner789',
      createdAt: oneWeekAgo,
      updatedAt: now,
    ),
  ];
});

void addProperty(WidgetRef ref, Property property) {
  // This function is a placeholder for adding a property to the list.
  // In a real application, you would implement the logic to add the property
  // to a database or an API.
  print('Adding property: ${property.title}');
}
void updateProperty(WidgetRef ref, Property property) {
  // This function is a placeholder for updating a property in the list.
  // In a real application, you would implement the logic to update the property
  // in a database or an API.
  print('Updating property: ${property.title}');
}
