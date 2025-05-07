import 'dart:io';
import 'package:amar_thikana/domain/models/property/property.dart';

abstract class PropertyRepositoryInterface {
  /// Creates a new property with images and returns the ID
  Future<String> createProperty(Property property, List<File> images);
  
  /// Updates an existing property
  Future<void> updateProperty(
    Property property, {
    List<File>? newImages,
    List<String>? removedImageUrls,
  });
  
  /// Deletes a property by ID
  Future<void> deleteProperty(String propertyId);
  
  /// Gets a property by ID
  Future<Property> getProperty(String propertyId);
  
  /// Gets properties belonging to a landlord
  Future<List<Property>> getLandlordProperties(String landlordId);
  
  /// Searches for properties based on criteria
  Future<List<Property>> searchProperties({
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    String? location,
    List<String>? amenities,
    String? genderPreference,
    double? minSize,
    double? maxSize,
  });
  
  /// Gets featured properties
  Future<List<Property>> getFeaturedProperties();
  
  /// Gets recent property listings
  Future<List<Property>> getRecentListings({int limit = 10});
  
  /// Updates a property's status
  Future<void> updatePropertyStatus(String propertyId, String status);
  
  /// Adds a photo to a property
  Future<String> addPropertyPhoto(String propertyId, File image);
  
  /// Removes a photo from a property
  Future<void> removePropertyPhoto(String propertyId, String imageUrl);
  
  /// Gets a property from cache
  Future<Property?> getPropertyFromCache(String propertyId);
  
  /// Gets detailed information about a property
  Future<Property?> getPropertyDetails(String propertyId);
  
  /// Caches property details
  Future<void> cachePropertyDetails(Property property);
}