import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/search/search_filters_provider.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';

class FilterSearch extends ConsumerWidget {
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(searchFiltersProvider);
    final notifier = ref.read(searchFiltersProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(width: 40, height: 4, color: Colors.grey[400]),
            ),
            const SizedBox(height: 20),
            Text('Sort by', style: AppTextStyles.h5),
            const SizedBox(height: 10),
            DropdownButton<String>(
              isExpanded: true,
              value: filters.sortBy,
              items: ['Lowest rent', 'Highest rent', 'Best rated']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  notifier.setSortBy(value);
                }
              },
            ),
            const SizedBox(height: 20),
            Text('Price range', style: AppTextStyles.h5),
            const SizedBox(height: 10),
            RangeSlider(
              values: filters.priceRange,
              min: 0,
              max: 5000,
              divisions: 100,
              labels: RangeLabels(
                '\$${filters.priceRange.start.round()}',
                '\$${filters.priceRange.end.round()}',
              ),
              onChanged: (range) {
                notifier.setPriceRange(range);
              },
            ),
            Text(
              'Average prices: \$${((filters.priceRange.start + filters.priceRange.end) / 2).round()}',
              style: AppTextStyles.bodySmall.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Text('Rating', style: AppTextStyles.h5),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                final star = index + 1;
                final selected = filters.rating == star;
                return GestureDetector(
                  onTap: () => notifier.setRating(star),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primaryLight : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('$star'),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Text('Facilities', style: AppTextStyles.h5),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Dining room', 'Bath place', 'TV room', 'Bedroom', 'Kitchen', 'Drawing room', 'Bathroom', 'Basin'
              ].map((facility) {
                final selected = filters.selectedFacilities.contains(facility);
                return GestureDetector(
                  onTap: () => notifier.toggleFacility(facility),
                  child: Chip(
                    label: Text(facility),
                    backgroundColor: selected ? AppColors.primaryLight : Colors.grey[200],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // After pop, it will apply automatically because riverpod state updated
                },
                child: const Text('Apply & Search'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
