import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/property/properties_provider.dart';

/// A use case responsible for retrieving all properties
class GetPropertiesUseCase {
  final Ref _ref;

  GetPropertiesUseCase(this._ref);

  /// Fetch all properties
  ///
  /// Returns a Future containing a list of [Property] objects
  /// or throws an exception if the operation fails
  Future<List<Property>> execute() async {
    try {
      // Get properties from the provider
      final propertiesAsyncValue = await _ref.read(propertiesProvider.future);
      return propertiesAsyncValue;
    } catch (e) {
      handleError(e, 'GetPropertiesUseCase.execute');
      throw Exception('Failed to get properties: $e');
    }
  }

  /// Get a property by its ID
  ///
  /// [id] - The ID of the property to retrieve
  /// Returns a [Property] object or throws an exception if not found
  Future<Property> getPropertyById(String id) async {
    try {
      final properties = await execute();
      final property = properties.firstWhere(
        (p) => p.id == id,
        orElse: () => throw Exception('Property not found'),
      );
      return property;
    } catch (e) {
      handleError(e, 'GetPropertiesUseCase.getPropertyById');
      throw Exception('Failed to get property by ID: $e');
    }
  }
}

/// Provider for GetPropertiesUseCase
final getPropertiesUseCaseProvider = Provider<GetPropertiesUseCase>((ref) {
  return GetPropertiesUseCase(ref);
});