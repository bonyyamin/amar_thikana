import 'package:amar_thikana/application/providers/property/properties_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

final propertySubmissionProvider =
    StateNotifierProvider<PropertySubmissionNotifier, AsyncValue<void>>(
      (ref) => PropertySubmissionNotifier(ref),
    );

class PropertySubmissionNotifier extends StateNotifier<AsyncValue<void>> {
  PropertySubmissionNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> submitProperty(Property property) async {
    try {
      state = const AsyncValue.loading();
      // TODO: Implement actual API call to save property
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      final propertyList = ref.read(propertyListProvider.notifier);
      if (property.id == 'new') {
        propertyList.addProperty(property);
      } else {
        propertyList.updateProperty(property);
      }

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
