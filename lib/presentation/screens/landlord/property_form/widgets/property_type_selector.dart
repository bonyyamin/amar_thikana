import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

class PropertyTypeSelector extends ConsumerWidget {
  const PropertyTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(propertyFormProvider);
    final formNotifier = ref.read(propertyFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Property Type',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children:
              PropertyType.values.map((type) {
                return ChoiceChip(
                  label: Text(type.name.toUpperCase()),
                  selected: formState.type == type,
                  onSelected: (selected) {
                    if (selected) formNotifier.updateType(type);
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
