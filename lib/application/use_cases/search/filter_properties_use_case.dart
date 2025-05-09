import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/search/search_filters_provider.dart';
import 'package:amar_thikana/application/use_cases/property/get_properties_use_case.dart';
import 'package:logging/logging.dart';

/// Use case for filtering properties based on search criteria
class FilterPropertiesUseCase {
  final Ref _ref;
  final _logger = Logger('FilterPropertiesUseCase');

  FilterPropertiesUseCase(this._ref);

  /// Filter properties based on the current search filters
  ///
  /// Returns a filtered list of [Property] objects
  Future<List<Property>> execute() async {
    try {
      // Get all properties
      final properties = await _ref.read(getPropertiesUseCaseProvider).execute();
      
      // Get current search filters
      final searchState = _ref.read(searchFiltersProvider);
      
      // Apply filters
      final filteredProperties = properties.where((property) {
        // Filter by price range
        final price = property.pricePerMonth;
        if (price < searchState.priceRange.start || 
            price > searchState.priceRange.end) {
          return false;
        }
        
        // Filter by rating
        if (property.rating != null && 
            property.rating! < searchState.rating) {
          return false;
        }
        
        // Filter by selected facilities/amenities
        if (searchState.selectedFacilities.isNotEmpty) {
          // Check if property has at least one of the selected facilities
          final hasSelectedFacility = property.amenities.any(
            (amenity) => searchState.selectedFacilities.contains(amenity)
          );
          
          if (!hasSelectedFacility) {
            return false;
          }
        }
        
        return true;
      }).toList();
      
      // Apply sorting
      switch (searchState.sortBy) {
        case 'Lowest rent':
          filteredProperties.sort((a, b) => a.pricePerMonth.compareTo(b.pricePerMonth));
          break;
        case 'Highest rent':
          filteredProperties.sort((a, b) => b.pricePerMonth.compareTo(a.pricePerMonth));
          break;
        case 'Best rated':
          filteredProperties.sort((a, b) {
            final aRating = a.rating ?? 0;
            final bRating = b.rating ?? 0;
            return bRating.compareTo(aRating);
          });
          break;
        default:
          // Default sort by newest
          filteredProperties.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
      
      return filteredProperties;
    } catch (e) {
      _logger.severe('Error filtering properties: $e');
      throw Exception('Failed to filter properties: $e');
    }
  }
}

/// Provider for FilterPropertiesUseCase
final filterPropertiesUseCaseProvider = Provider<FilterPropertiesUseCase>((ref) {
  return FilterPropertiesUseCase(ref);
});