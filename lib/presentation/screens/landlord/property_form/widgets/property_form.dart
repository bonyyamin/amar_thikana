import 'package:amar_thikana/application/providers/property/properties_notifier.dart';
import 'package:amar_thikana/application/providers/property/property_submission_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/amenities_selector.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/location_picker.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/photo_uploader.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/property_type_selector.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/rules_selector.dart';
import 'package:go_router/go_router.dart';

class PropertyFormWidget extends ConsumerStatefulWidget {
  final bool isEditing;
  final String? propertyId;

  const PropertyFormWidget({
    super.key,
    this.isEditing = false,
    this.propertyId,
  });

  @override
  ConsumerState<PropertyFormWidget> createState() => _PropertyFormWidgetState();
}

class _PropertyFormWidgetState extends ConsumerState<PropertyFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.propertyId != null) {
      // Load existing property data
      final property = ref
          .read(propertyListProvider.notifier)
          .getPropertyById(widget.propertyId!);
      if (property != null) {
        ref.read(propertyFormProvider.notifier)
          ..updateTitle(property.title)
          ..updateDescription(property.description ?? '')
          ..updatePrice(property.pricePerMonth)
          ..updateType(property.type)
          ..updateAmenities(property.amenities)
          ..updateRules(property.rules)
          ..updateLocation(property.location?.city ?? '')
          ..updatePhotos(property.photos);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(propertyFormProvider);
    final formNotifier = ref.read(propertyFormProvider.notifier);
    final submissionStatus = ref.watch(propertySubmissionProvider);

    return Stack(
      children: [
        Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Basic Information
              TextFormField(
                initialValue: formState.title,
                decoration: const InputDecoration(labelText: 'Property Title'),
                validator:
                    (value) => value!.isEmpty ? 'Please enter a title' : null,
                onChanged: formNotifier.updateTitle,
              ),
              const SizedBox(height: 16),

              const PropertyTypeSelector(),
              const SizedBox(height: 16),

              const LocationPicker(),
              const SizedBox(height: 16),

              const PhotoUploader(),
              const SizedBox(height: 16),

              const AmenitiesSelector(),
              const SizedBox(height: 16),

              const RulesSelector(),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: submissionStatus.isLoading ? null : _submitForm,
                child:
                    submissionStatus.isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                          widget.isEditing ? 'Update Property' : 'Add Property',
                        ),
              ),
            ],
          ),
        ),
        if (submissionStatus.isLoading)
          const Center(child: CircularProgressIndicator()),
      ],
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final formState = ref.read(propertyFormProvider);
      final submissionState = ref.read(propertySubmissionProvider.notifier);

      // Create a temporary location for now - this should be properly set from LocationPicker
      final location = Location(
        city: formState.location ?? 'Dhaka',
        state: 'Dhaka',
        country: 'Bangladesh',
      );

      final property = Property(
        id: widget.isEditing ? widget.propertyId! : DateTime.now().toString(),
        title: formState.title,
        description: formState.description,
        pricePerMonth: formState.pricePerMonth,
        type: formState.type,
        amenities: formState.amenities,
        rules: formState.rules,
        location: location,
        photos: formState.photos,
        ownerId: 'current_user_id', // TODO: Get from auth provider
        createdAt: widget.isEditing ? DateTime.now() : DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await submissionState.submitProperty(property);

      if (mounted) {
        ref.read(propertyFormProvider.notifier).reset();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.isEditing
                  ? 'Property updated successfully!'
                  : 'Property added successfully!',
            ),
          ),
        );
        if (context.mounted) context.pop();
      }
    }
  }
}
