// lib/application/use_cases/property/create_property_use_case.dart

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
  Future<Property> execute(Property property) async {
    // 1) Field‑name fixes:
    if (property.title.isEmpty) {
      throw Failure('Property title cannot be empty');
    }
    if (property.pricePerMonth <= 0) {
      throw Failure('Monthly price must be greater than zero');
    }
    if (property.location == null) {
      throw Failure('Property location is required');
    }
    if (property.photos.isEmpty) {
      throw Failure('At least one property photo is required');
    }

    // 2) Pass the ownerId (and any other required args) into your repo:
    //    assuming your interface is:
    //      Future<String> createProperty(Property p, String ownerId);
    final newId = await _repository.createProperty(property, _ownerId);

    // 3) Return a fully‑populated Property object (with the new ID):
    return property.copyWith(id: newId);
  }
}

/// Provider wiring—grabs both your repo and the current user’s ID:
final createPropertyUseCaseProvider = Provider<CreatePropertyUseCase>((ref) {
  final repo    = ref.watch(propertyRepositoryProvider);
  final ownerId = ref.watch(currentUserProvider)?.id; // Assuming you have a provider for the current user
  return CreatePropertyUseCase(repo, ownerId!);
});
