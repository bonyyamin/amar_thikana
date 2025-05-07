import 'dart:io';
import 'package:amar_thikana/domain/repository/property_repository_interface.dart';
import '../../domain/models/property/property.dart';
import '../datasources/remote/property_remote_datasource.dart';
import '../datasources/local/property_local_datasource.dart';
import '../services/storage_service.dart';

class PropertyRepository implements PropertyRepositoryInterface {
  final PropertyRemoteDataSource _remoteDataSource;
  final PropertyLocalDataSource _localDataSource;
  final StorageService _storageService;

  PropertyRepository(
    this._remoteDataSource,
    this._localDataSource,
    this._storageService,
  );

  @override
  Future<String> createProperty(Property property, List<File> images) async {
    try {
      // Upload images and get URLs
      List<String> imageUrls = [];
      if (images.isNotEmpty) {
        imageUrls = await _storageService.uploadPropertyImages(
          property.ownerId,
          images,
        );
      }

      // Create a copy of the property with image URLs
      final propertyWithImages = property.copyWith(
        photos: imageUrls,
      );

      // Save to Firestore
      final propertyId = await _remoteDataSource.createProperty(
        propertyWithImages,
      );

      // Save to local cache if needed
      await _localDataSource.cacheProperty(
        propertyWithImages.copyWith(id: propertyId),
      );

      return propertyId;
    } catch (e) {
      throw Exception('Failed to create property: $e');
    }
  }

  @override
  Future<void> updateProperty(
    Property property, {
    List<File>? newImages,
    List<String>? removedImageUrls,
  }) async {
    try {
      List<String> updatedImageUrls = List.from(property.photos);

      // Remove images that were marked for deletion
      if (removedImageUrls != null && removedImageUrls.isNotEmpty) {
        for (final url in removedImageUrls) {
          await _storageService.deleteFile(url);
          updatedImageUrls.remove(url);
        }
      }

      // Upload new images
      if (newImages != null && newImages.isNotEmpty) {
        final newUrls = await _storageService.uploadPropertyImages(
          property.ownerId,
          newImages,
        );
        updatedImageUrls.addAll(newUrls);
      }

      // Update property with new image list
      final updatedProperty = property.copyWith(
        photos: updatedImageUrls,
        updatedAt: DateTime.now(),
      );

      // Update in Firestore
      await _remoteDataSource.updateProperty(updatedProperty);

      // Update local cache
      await _localDataSource.cacheProperty(updatedProperty);
    } catch (e) {
      throw Exception('Failed to update property: $e');
    }
  }

  @override
  Future<void> deleteProperty(String propertyId) async {
    try {
      // Get property to access image URLs
      final property = await getProperty(propertyId);

      // Delete all images from storage
      for (final url in property.photos) {
        await _storageService.deleteFile(url);
      }

      // Delete from Firestore
      await _remoteDataSource.deleteProperty(propertyId);

      // Remove from local cache
      await _localDataSource.removeProperty(propertyId);
    } catch (e) {
      throw Exception('Failed to delete property: $e');
    }
  }

  @override
  Future<Property> getProperty(String propertyId) async {
    try {
      // Try to get from local cache first
      final cachedProperty = await _localDataSource.getProperty(propertyId);
      if (cachedProperty != null) {
        return cachedProperty;
      }

      // If not in cache, get from remote
      final property = await _remoteDataSource.getProperty(propertyId);

      // Cache the result for future use
      await _localDataSource.cacheProperty(property);

      return property;
    } catch (e) {
      throw Exception('Failed to get property: $e');
    }
  }
  
  @override
  Future<Property?> getPropertyFromCache(String propertyId) async {
    return await _localDataSource.getProperty(propertyId);
  }
  
  @override
  Future<Property?> getPropertyDetails(String propertyId) async {
    try {
      return await _remoteDataSource.getProperty(propertyId);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<void> cachePropertyDetails(Property property) async {
    await _localDataSource.cacheProperty(property);
  }

  @override
  Future<List<Property>> getLandlordProperties(String landlordId) async {
    try {
      // Get properties from remote
      final properties = await _remoteDataSource.getLandlordProperties(
        landlordId,
      );

      // Cache properties locally
      for (final property in properties) {
        await _localDataSource.cacheProperty(property);
      }

      return properties;
    } catch (e) {
      throw Exception('Failed to get landlord properties: $e');
    }
  }

  @override
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
      return await _remoteDataSource.searchProperties(
        propertyType: propertyType,
        minPrice: minPrice,
        maxPrice: maxPrice,
        location: location,
        amenities: amenities,
        genderPreference: genderPreference,
        minSize: minSize,
        maxSize: maxSize,
      );
    } catch (e) {
      throw Exception('Failed to search properties: $e');
    }
  }

  @override
  Future<List<Property>> getFeaturedProperties() async {
    try {
      // Get featured properties from remote
      final properties = await _remoteDataSource.getFeaturedProperties();

      // Cache properties locally
      for (final property in properties) {
        await _localDataSource.cacheProperty(property);
      }

      return properties;
    } catch (e) {
      throw Exception('Failed to get featured properties: $e');
    }
  }

  @override
  Future<List<Property>> getRecentListings({int limit = 10}) async {
    try {
      // Get recent listings from remote
      final properties = await _remoteDataSource.getRecentListings(
        limit: limit,
      );

      // Cache properties locally
      for (final property in properties) {
        await _localDataSource.cacheProperty(property);
      }

      return properties;
    } catch (e) {
      throw Exception('Failed to get recent listings: $e');
    }
  }

  @override
  Future<void> updatePropertyStatus(String propertyId, String status) async {
    try {
      // Update status in remote
      await _remoteDataSource.updatePropertyStatus(propertyId, status);

      // Update cached property if exists
      final cachedProperty = await _localDataSource.getProperty(propertyId);
      if (cachedProperty != null) {
        final updatedProperty = cachedProperty.copyWith(
          updatedAt: DateTime.now(),
          // Assuming there's a status field in the Property model
          // status: status,
        );
        await _localDataSource.cacheProperty(updatedProperty);
      }
    } catch (e) {
      throw Exception('Failed to update property status: $e');
    }
  }

  @override
  Future<String> addPropertyPhoto(String propertyId, File image) async {
    try {
      // Get the property first
      final property = await getProperty(propertyId);

      // Upload the new image
      final imageUrl =
          (await _storageService.uploadPropertyImages(property.ownerId, [
            image,
          ])).first;

      // Update property with new image URL
      final updatedProperty = property.copyWith(
        photos: [...property.photos, imageUrl],
        updatedAt: DateTime.now(),
      );

      // Update in remote and local cache
      await _remoteDataSource.updateProperty(updatedProperty);
      await _localDataSource.cacheProperty(updatedProperty);

      return imageUrl;
    } catch (e) {
      throw Exception('Failed to add property photo: $e');
    }
  }

  @override
  Future<void> removePropertyPhoto(String propertyId, String imageUrl) async {
    try {
      // Get the property first
      final property = await getProperty(propertyId);

      // Delete the image from storage
      await _storageService.deleteFile(imageUrl);

      // Update property without the removed image
      final updatedProperty = property.copyWith(
        photos: property.photos.where((url) => url != imageUrl).toList(),
        updatedAt: DateTime.now(),
      );

      // Update in remote and local cache
      await _remoteDataSource.updateProperty(updatedProperty);
      await _localDataSource.cacheProperty(updatedProperty);
    } catch (e) {
      throw Exception('Failed to remove property photo: $e');
    }
  }
}