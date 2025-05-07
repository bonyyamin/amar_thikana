import 'dart:io';
import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:amar_thikana/application/providers/property/property_repository_provider.dart';
import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/domain/repository/property_repository_interface.dart';

class CreatePropertyUseCase {
  final PropertyRepositoryInterface _repository;
  final String _ownerId;

  CreatePropertyUseCase(this._repository, this._ownerId);

  /// Creates a new property and returns it with its assigned ID.
  Future<Property> execute(Property property, List<File> images) async {
    // 1) Field‑name validations:
    if (property.title.isEmpty) {
      throw Failure('Property title cannot be empty');
    }
    if (property.pricePerMonth <= 0) {
      throw Failure('Monthly price must be greater than zero');
    }
    if (property.location == null) {
      throw Failure('Property location is required');
    }

    // Set owner ID from constructor
    final propertyWithOwner = property.copyWith(ownerId: _ownerId);
    
    // 2) Pass the property and images to repository:
    final newId = await _repository.createProperty(propertyWithOwner, images);

    // 3) Return a fully‑populated Property object (with the new ID):
    return propertyWithOwner.copyWith(id: newId);
  }
}

/// Provider wiring—grabs both your repo and the current user's ID:
final createPropertyUseCaseProvider = Provider<CreatePropertyUseCase>((ref) {
  final repo    = ref.watch(propertyRepositoryProvider);
  final ownerId = ref.watch(currentUserProvider)?.id ?? ''; 
  return CreatePropertyUseCase(repo, ownerId);
});