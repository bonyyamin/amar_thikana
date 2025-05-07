import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/domain/models/property/amenity.dart';

class AmenityChip extends StatelessWidget {
  final Amenity amenity;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isSelectable;

  const AmenityChip({
    super.key,
    required this.amenity,
    this.isSelected = false,
    this.onTap,
    this.isSelectable = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelectable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.primary.withOpacity(0.1)
                  : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              amenity.iconPath,
              width: 16,
              height: 16,
              color: isSelected ? AppColors.primary : Colors.grey[600],
            ),
            const SizedBox(width: 6),
            Text(
              amenity.displayName,
              style: TextStyle(
                color: isSelected ? AppColors.primary : Colors.grey[600],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
