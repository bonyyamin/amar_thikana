import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_provider.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/property_form.dart';

class EditPropertyScreen extends ConsumerWidget {
  final String propertyId;

  const EditPropertyScreen({super.key, required this.propertyId});

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

        return Scaffold(
          appBar: AppBar(title: Text('Edit ${property.title}')),
          body: PropertyFormWidget(isEditing: true, propertyId: propertyId),
        );
      },
    );
  }
}
