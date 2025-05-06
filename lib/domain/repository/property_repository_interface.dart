import 'dart:io';
import '../models/property/property.dart';

abstract class PropertyRepositoryInterface {
  // Create a new property listing
  Future<String> createProperty(Property property, List<File> images);
  
  // Update an existing property
  Future<void> updateProperty(Property property, {List<File>? newImages, List<String>? removedImageUrls});
  
  // Delete a property listing
  Future<void> deleteProperty(String propertyId);
  
  // Get a property by ID
  Future<Property> getProperty(String propertyId);
  
  // Get all properties for a landlord
  Future<List<Property>> getLandlordProperties(String landlordId);
  
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
  });
  
  // Get featured properties
  Future<List<Property>> getFeaturedProperties();
  
  // Get recent listings
  Future<List<Property>> getRecentListings({int limit = 10});
  
  // Change property status (available, rented, etc.)
  Future<void> updatePropertyStatus(String propertyId, String status);
  
  // Add photo to property
  Future<String> addPropertyPhoto(String propertyId, File image);
  
  // Remove photo from property
  Future<void> removePropertyPhoto(String propertyId, String imageUrl);
}