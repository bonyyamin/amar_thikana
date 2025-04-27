import 'package:amar_thikana/application/providers/property/properties_provider.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/presentation/screens/renter/home/widgets/featured_properties.dart';
import 'package:amar_thikana/presentation/screens/renter/home/widgets/filter_search.dart';
import 'package:amar_thikana/presentation/screens/renter/home/widgets/header.dart';
import 'package:amar_thikana/presentation/screens/renter/home/widgets/home_heading_text.dart';
import 'package:amar_thikana/presentation/screens/renter/home/widgets/property_type_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property_type/selected_property_type_provider.dart';

class RenterHomeScreen extends ConsumerWidget {
  const RenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = ref.watch(propertiesProvider);
    final selectedType = ref.watch(selectedPropertyTypeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Header(),
              const SizedBox(height: 20),
              const HomeHeadingText(),
              const SizedBox(height: 20),
              _SearchBar(),
              const SizedBox(height: 20),
              const PropertyTypeFilters(),
              const SizedBox(height: 20),
              Text(
                '$selectedType Properties',
                style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              propertiesAsync.map(
                data: (data) {
                  final filteredProperties =
                      selectedType == 'Featured'
                          ? data.value
                          : data.value
                              .where(
                                (p) => p.type.toString().toLowerCase().contains(
                                  selectedType.toLowerCase(),
                                ),
                              )
                              .toList();

                  return filteredProperties.isEmpty
                      ? const Center(child: Text('No properties found'))
                      : FeaturedProperties(properties: filteredProperties);
                },
                loading: (_) => const _LoadingIndicator(),
                error:
                    (error) => _ErrorDisplay(message: error.error.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  final String message;
  const _ErrorDisplay({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.divider, width: 2),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF4C71D5)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search for properties...',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onSubmitted: (query) {
                        // Handle search action
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divider, width: 2),
            ),
            child: IconButton(
              icon: const Icon(Icons.tune),
              color: AppColors.primaryLight,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => const FilterSearch(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
