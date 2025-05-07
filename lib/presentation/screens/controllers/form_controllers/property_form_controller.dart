import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/property/property_submission_provider.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';

class PropertyFormController extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef ref;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  PropertyFormController(this.ref) : super(const AsyncValue.data(null));

  void initializeForm(Property? property) {
    if (property != null) {
      titleController.text = property.title;
      descriptionController.text = property.description ?? '';
      priceController.text = property.pricePerMonth.toString();

      // Update form state with individual calls
      final formNotifier = ref.read(propertyFormProvider.notifier);
      formNotifier
        ..updateTitle(property.title)
        ..updateDescription(property.description ?? '')
        ..updatePrice(property.pricePerMonth)
        ..updateType(property.type)
        ..updateAmenities(property.amenities)
        ..updateRules(property.rules)
        ..updatePhotos(property.photos);
    }
  }

  Future<bool> submitForm(String? propertyId) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final formState = ref.read(propertyFormProvider);
      final submissionState = ref.read(propertySubmissionProvider.notifier);

      final property = Property(
        id: propertyId ?? 'new',
        title: titleController.text,
        description: descriptionController.text,
        pricePerMonth: double.parse(priceController.text),
        type: formState.type,
        amenities: formState.amenities,
        rules: formState.rules,
        photos: formState.photos,
        ownerId: 'current_user_id', // TODO: Get from auth provider
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        location: null, // TODO: Add location picker
        coverImage: formState.photos.isNotEmpty ? formState.photos.first : null,
        rating: null,
        reviewsCount: null,
        bedrooms: null,
        bathrooms: null,
        parkingSpaces: null,
      );

      await submissionState.submitProperty(property);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
