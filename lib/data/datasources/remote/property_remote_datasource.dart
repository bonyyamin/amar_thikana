import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/models/property/property.dart';
import '../../dtos/property_dto.dart';
import '../../services/firebase_service.dart';

class PropertyRemoteDataSource {
  final FirebaseService _firebaseService;

  PropertyRemoteDataSource(this._firebaseService);

  // Create a new property in Firestore
  Future<String> createProperty(Property property) async {
    try {
      // Convert domain model to DTO
      final propertyDto = PropertyDto.fromDomain(property);

      // Add to Firestore
      final docRef = await _firebaseService.firestore
          .collection('properties')
          .add(propertyDto.toJson());

      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create property: $e');
    }
  }

  // Get a property by ID
  Future<Property> getProperty(String propertyId) async {
    try {
      final doc =
          await _firebaseService.firestore
              .collection('properties')
              .doc(propertyId)
              .get();

      if (!doc.exists) {
        throw Exception('Property not found');
      }

      // Convert to DTO then domain model
      final propertyDto = PropertyDto.fromJson(doc.data()!);
      return propertyDto.toDomain().copyWith(id: propertyId);
    } catch (e) {
      throw Exception('Failed to get property: $e');
    }
  }

  // Update an existing property
  Future<void> updateProperty(Property property) async {
    try {
      // Convert domain model to DTO
      final propertyDto = PropertyDto.fromDomain(property);

      // Update in Firestore
      await _firebaseService.firestore
          .collection('properties')
          .doc(property.id)
          .update(propertyDto.toJson());
    } catch (e) {
      throw Exception('Failed to update property: $e');
    }
  }

  // Delete a property
  Future<void> deleteProperty(String propertyId) async {
    try {
      await _firebaseService.firestore
          .collection('properties')
          .doc(propertyId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete property: $e');
    }
  }

  // Get all properties for a landlord
  Future<List<Property>> getLandlordProperties(String landlordId) async {
    try {
      final querySnapshot =
          await _firebaseService.firestore
              .collection('properties')
              .where('landlordId', isEqualTo: landlordId)
              .get();

      return querySnapshot.docs.map((doc) {
        final propertyDto = PropertyDto.fromJson(doc.data());
        return propertyDto.toDomain().copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get landlord properties: $e');
    }
  }

  // Search properties with filters
  Future<List<Property>> searchProperties({
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    String? location,
    List<String>? amenities,
    String? genderPreference,
    double? minSize,
    double? maxSize,
  }) async {
    try {
      // Start with a base query for available properties
      Query query = _firebaseService.firestore
          .collection('properties')
          .where('status', isEqualTo: 'available');

      // Apply filters
      if (propertyType != null && propertyType != 'All') {
        query = query.where(
          'type',
          isEqualTo: propertyType,
        ); // Changed from propertyType to type
      }

      if (minPrice != null) {
        query = query.where(
          'pricePerMonth',
          isGreaterThanOrEqualTo: minPrice,
        ); // Changed from rent to pricePerMonth
      }

      if (maxPrice != null) {
        query = query.where(
          'pricePerMonth',
          isLessThanOrEqualTo: maxPrice,
        ); // Changed from rent to pricePerMonth
      }

      // For complex queries (like location, amenities, etc.), we might need to fetch first then filter in memory
      final querySnapshot = await query.get();

      List<Property> properties =
          querySnapshot.docs.map((doc) {
            final propertyDto = PropertyDto.fromJson(
              doc.data() as Map<String, dynamic>,
            );
            return propertyDto.toDomain().copyWith(id: doc.id);
          }).toList();

      // Fix nullable access with null checks
      if (location != null) {
        properties =
            properties.where((property) {
              final propertyArea = property.location?.address.area;
              if (propertyArea == null) return false;
              return propertyArea.toLowerCase().contains(
                location.toLowerCase(),
              );
            }).toList();
      }

      if (amenities != null && amenities.isNotEmpty) {
        properties =
            properties.where((property) {
              return amenities.every(
                (amenity) => property.amenities.contains(amenity),
              );
            }).toList();
      }

      if (genderPreference != null) {
        properties =
            properties.where((property) {
              final rules = property.rules;
              return rules.any(
                (rule) =>
                    rule.toLowerCase().contains(
                      'gender:${genderPreference.toLowerCase()}',
                    ) ||
                    rule.toLowerCase().contains('gender:any'),
              );
            }).toList();
      }

      // Remove size filtering since it's not part of the Property model
      // Consider adding size to the Property model if needed
      // if (minSize != null) { ... }
      // if (maxSize != null) { ... }

      return properties;
    } catch (e) {
      throw Exception('Failed to search properties: $e');
    }
  }

  // Get featured properties
  Future<List<Property>> getFeaturedProperties() async {
    try {
      final querySnapshot =
          await _firebaseService.firestore
              .collection('properties')
              .where('status', isEqualTo: 'available')
              .where('featured', isEqualTo: true)
              .limit(10)
              .get();

      return querySnapshot.docs.map((doc) {
        final propertyDto = PropertyDto.fromJson(
          doc.data(),
        );
        return propertyDto.toDomain().copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get featured properties: $e');
    }
  }

  // Get recent listings
  Future<List<Property>> getRecentListings({int limit = 10}) async {
    try {
      final querySnapshot =
          await _firebaseService.firestore
              .collection('properties')
              .where('status', isEqualTo: 'available')
              .orderBy('createdAt', descending: true)
              .limit(limit)
              .get();

      return querySnapshot.docs.map((doc) {
        final propertyDto = PropertyDto.fromJson(
          doc.data(),
        );
        return propertyDto.toDomain().copyWith(id: doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get recent listings: $e');
    }
  }

  // Update property status
  Future<void> updatePropertyStatus(String propertyId, String status) async {
    try {
      await _firebaseService.firestore
          .collection('properties')
          .doc(propertyId)
          .update({
            'status': status,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      throw Exception('Failed to update property status: $e');
    }
  }

  // Update property images
  Future<void> updatePropertyImages(
    String propertyId,
    List<String> imageUrls,
  ) async {
    try {
      await _firebaseService.firestore
          .collection('properties')
          .doc(propertyId)
          .update({
            'imageUrls': imageUrls,
            'updatedAt': FieldValue.serverTimestamp(),
          });
    } catch (e) {
      throw Exception('Failed to update property images: $e');
    }
  }
}
