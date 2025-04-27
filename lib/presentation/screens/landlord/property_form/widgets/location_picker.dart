import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';

class LocationPicker extends ConsumerWidget {
  const LocationPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formNotifier = ref.read(propertyFormProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // TODO: Implement Google Maps widget here
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    // TODO: Handle location selection
                    formNotifier.updateLocation('Selected Location');
                  },
                  icon: const Icon(Icons.add_location),
                  label: const Text('Select Location'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
