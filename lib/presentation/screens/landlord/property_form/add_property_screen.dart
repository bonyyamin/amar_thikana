import 'package:flutter/material.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/widgets/property_form.dart';

class PropertyForm extends StatelessWidget {
  const PropertyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Property')),
      body: const PropertyFormWidget(),
    );
  }
}
