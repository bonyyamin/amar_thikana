import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/use_cases/search/filter_properties_use_case.dart';
import 'package:logging/logging.dart';

/// Use case for searching properties by text query
class SearchPropertiesUseCase {
  final Ref _ref;
  final _logger = Logger('SearchPropertiesUseCase');

  SearchPropertiesUseCase(this._ref);

  /// Search properties based on a text query
  /// 
  /// [query] - The search query text
  /// Returns a list of [Property] objects that match the query
  Future<List<Property>> execute(String query) async {
    try {
      // First, get filtered properties based on current filters
      final filteredProperties = await _ref.read(filterPropertiesUseCaseProvider).execute();
      
      // If query is empty, return all filtered properties
      if (query.trim().isEmpty) {
        return filteredProperties;
      }
      
      // Normalize query for case-insensitive search
      final normalizedQuery = query.toLowerCase().trim();
      
      // Search in title, description, location, and amenities
      final searchResults = filteredProperties.where((property) {
        // Search in title
        if (property.title.toLowerCase().contains(normalizedQuery)) {
          return true;
        }
        
        // Search in description
        if (property.description != null && 
            property.description!.toLowerCase().contains(normalizedQuery)) {
          return true;
        }
        
        // Search in location
        if (property.location != null) {
          // Check city
          if (property.location!.city.toLowerCase().contains(normalizedQuery)) {
            return true;
          }
          
          // Check state
          if (property.location!.state.toLowerCase().contains(normalizedQuery)) {
            return true;
          }
          
          // Check country
          if (property.location!.country.toLowerCase().contains(normalizedQuery)) {
            return true;
          }
          
          // Check address
          final address = property.location!.address;
          
          if (address.street.toLowerCase().contains(normalizedQuery) ||
              address.area.toLowerCase().contains(normalizedQuery) ||
              address.city.toLowerCase().contains(normalizedQuery) ||
              address.postalCode.toLowerCase().contains(normalizedQuery) ||
              address.country.toLowerCase().contains(normalizedQuery)) {
            return true;
          }
                }
        
        // Search in amenities
        if (property.amenities.any((amenity) => 
            amenity.toLowerCase().contains(normalizedQuery))) {
          return true;
        }
        
        // Search in property type
        if (property.type.toString().toLowerCase().contains(normalizedQuery)) {
          return true;
        }
        
        return false;
      }).toList();
      
      return searchResults;
    } catch (e) {
      _logger.severe('Error searching properties: $e');
      throw Exception('Failed to search properties: $e');
    }
  }
  
  /// Search properties by location (city, state, country)
  /// 
  /// [location] - The location to search for
  /// Returns a list of [Property] objects in the specified location
  Future<List<Property>> searchByLocation(String location) async {
    try {
      // First, get filtered properties based on current filters
      final filteredProperties = await _ref.read(filterPropertiesUseCaseProvider).execute();
      
      // Normalize location for case-insensitive search
      final normalizedLocation = location.toLowerCase().trim();
      
      // Search in location fields
      final searchResults = filteredProperties.where((property) {
        if (property.location == null) {
          return false;
        }
        
        // Check city, state, country
        return property.location!.city.toLowerCase().contains(normalizedLocation) ||
               property.location!.state.toLowerCase().contains(normalizedLocation) ||
               property.location!.country.toLowerCase().contains(normalizedLocation);
      }).toList();
      
      return searchResults;
    } catch (e) {
      _logger.severe('Error searching properties by location: $e');
      throw Exception('Failed to search properties by location: $e');
    }
  }
}

/// Provider for SearchPropertiesUseCase
final searchPropertiesUseCaseProvider = Provider<SearchPropertiesUseCase>((ref) {
  return SearchPropertiesUseCase(ref);
});

/// Provider for search results based on a query
/// This provider depends on the search query and returns filtered properties
final searchResultsProvider = FutureProvider.family<List<Property>, String>((ref, query) async {
  final searchUseCase = ref.read(searchPropertiesUseCaseProvider);
  return await searchUseCase.execute(query);
});