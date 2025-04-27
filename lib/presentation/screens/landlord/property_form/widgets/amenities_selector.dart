import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';

class AmenitiesSelector extends ConsumerStatefulWidget {
  const AmenitiesSelector({super.key});

  @override
  ConsumerState<AmenitiesSelector> createState() => _AmenitiesSelectorState();
}

class _AmenitiesSelectorState extends ConsumerState<AmenitiesSelector> {
  final List<Map<String, dynamic>> _amenities = [
    {'name': 'WiFi', 'icon': Icons.wifi, 'selected': false},
    {'name': 'AC', 'icon': Icons.ac_unit, 'selected': false},
    {'name': 'Parking', 'icon': Icons.local_parking, 'selected': false},
    {'name': 'Kitchen', 'icon': Icons.kitchen, 'selected': false},
    {'name': 'TV', 'icon': Icons.tv, 'selected': false},
    {
      'name': 'Washing Machine',
      'icon': Icons.local_laundry_service,
      'selected': false,
    },
    {'name': 'Generator', 'icon': Icons.power, 'selected': false},
    {'name': 'CCTV', 'icon': Icons.security, 'selected': false},
  ];

  @override
  void initState() {
    super.initState();
    final currentAmenities = ref.read(propertyFormProvider).amenities;
    for (var amenity in _amenities) {
      if (currentAmenities.contains(amenity['name'])) {
        amenity['selected'] = true;
      }
    }
  }

  void _updateFormAmenities() {
    final selectedAmenities =
        _amenities
            .where((a) => a['selected'] as bool)
            .map((a) => a['name'] as String)
            .toList();
    ref.read(propertyFormProvider.notifier).updateAmenities(selectedAmenities);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              _amenities.map((amenity) {
                return FilterChip(
                  selected: amenity['selected'] as bool,
                  label: Text(amenity['name'] as String),
                  avatar: Icon(amenity['icon'] as IconData),
                  onSelected: (bool selected) {
                    setState(() {
                      amenity['selected'] = selected;
                    });
                    _updateFormAmenities();
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
