import 'package:amar_thikana/application/providers/property/property_provider.dart';
import 'package:amar_thikana/presentation/screens/renter/property_details/property_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PropertyPreviewScreen extends ConsumerWidget {
  final String propertyId;

  const PropertyPreviewScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyAsync = ref.watch(propertyListProvider);

    return propertyAsync.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (error, stack) =>
              Scaffold(body: Center(child: Text('Error: $error'))),
      data: (properties) {
        final property = properties.firstWhere(
          (p) => p.id == propertyId,
          orElse: () => throw Exception('Property not found'),
        );

        return PropertyDetailsScreen(property: property);
      },
    );
  }
}
