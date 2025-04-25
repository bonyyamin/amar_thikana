import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property_type/selected_property_type_provider.dart';

class PropertyTypeFilters extends ConsumerWidget {
  const PropertyTypeFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(selectedPropertyTypeProvider);
    final types = ['Featured', 'Building', 'Room', 'House', 'Apartment'];
    final icons = {
      'Featured': [
        'assets/icons/featured_blue.png',
        'assets/icons/featured.png',
      ],
      'Building': [
        'assets/icons/building_blue.png',
        'assets/icons/building.png',
      ],
      'Room': ['assets/icons/room_blue.png', 'assets/icons/room.png'],
      'House': ['assets/icons/seat_blue.png', 'assets/icons/seat.png'],
      'Apartment': ['assets/icons/hostel_blue.png', 'assets/icons/hostel.png'],
    };

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        itemBuilder: (context, index) {
          final isSelected = types[index] == selectedType;

          return GestureDetector(
            onTap: () {
              ref.read(selectedPropertyTypeProvider.notifier).state =
                  types[index];
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Smooth animation
              curve: Curves.easeInOut, // Smooth curve
              width: isSelected ? 90 : 80, // Slight expansion effect
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryLight : AppColors.divider,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Image.asset(
                      icons[types[index]]![isSelected ? 1 : 0],
                      key: ValueKey(isSelected), // Ensures smooth transitions
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    types[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.primaryLight,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
