// lib/application/use_cases/property/delete_property_use_case.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/application/providers/property/property_repository_provider.dart';
import 'package:amar_thikana/domain/repository/property_repository_interface.dart';

class DeletePropertyUseCase {
  final PropertyRepositoryInterface _repository;

  DeletePropertyUseCase(this._repository);

  /// Deletes a property listing from the system.
  ///
  /// [propertyId] – The unique identifier of the property to delete.
  ///
  /// Returns true if the property was successfully deleted.
  /// Throws [Failure] if the propertyId is empty or if the deletion fails.
  Future<bool> execute(String propertyId) async {
    if (propertyId.isEmpty) {
      throw Failure('Property ID cannot be empty');
    }

    try {
      // Calls the repo; assume it returns Future<void> or throws on error
      await _repository.deleteProperty(propertyId);
      return true;
    } catch (e) {
      throw Failure('Failed to delete property: ${e.toString()}');
    }
  }
}

/// Provider for [DeletePropertyUseCase]
final deletePropertyUseCaseProvider =
    Provider<DeletePropertyUseCase>((ref) {
  return DeletePropertyUseCase(
    ref.watch(propertyRepositoryProvider),
  );
});
