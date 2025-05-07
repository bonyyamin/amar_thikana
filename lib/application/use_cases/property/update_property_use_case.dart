import 'package:amar_thikana/application/providers/property/property_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/property/property.dart';
import '../../../domain/repository/property_repository_interface.dart';
import '../../../core/errors/failure.dart';

class UpdatePropertyUseCase {
  final PropertyRepositoryInterface _repository;

  UpdatePropertyUseCase(this._repository);

  /// Updates an existing property listing.
  ///
  /// [property] - The updated property data.
  ///
  /// Returns the updated `Property` on success, otherwise throws a `Failure`.
  Future<Property> execute(Property property) async {
    // Validate required fields
    _validateProperty(property);

    // Check if the property exists
    final propertyExists = await _repository.propertyExists(property.id);
    if (!propertyExists) {
      throw Failure('Property not found.');
    }

    try {
      // Update the property
      await _repository.updateProperty(property);

      // Retrieve the updated property to return the latest data
      final updatedProperty = await _repository.getProperty(property.id);

      // Cache the latest property details for performance
      await _repository.savePropertyCache(updatedProperty);

      return updatedProperty;
    } catch (e) {
      throw Failure('Failed to update property: ${e.toString()}');
    }
  }

  void _validateProperty(Property property) {
    if (property.id.isEmpty) throw Failure('Property ID is required.');
    if (property.title.isEmpty) throw Failure('Property title cannot be empty.');
    if (property.pricePerMonth <= 0) throw Failure('Property price must be greater than zero.');
    if (property.location == null) throw Failure('Property location is required.');
    if (property.photos.isEmpty) throw Failure('At least one property image is required.');
  }
}

/// Provider for `UpdatePropertyUseCase`
final updatePropertyUseCaseProvider = Provider<UpdatePropertyUseCase>(
  (ref) => UpdatePropertyUseCase(ref.read(propertyRepositoryProvider)),
);