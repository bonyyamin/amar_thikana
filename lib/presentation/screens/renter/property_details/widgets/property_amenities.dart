import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

class PropertyAmenities extends StatelessWidget {
  final Property property;

  const PropertyAmenities({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Property Details',
          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAmenityItem(Icons.king_bed_outlined, '${property.bedrooms} Beds'),
            _buildAmenityItem(Icons.bathtub_outlined, '${property.bathrooms} Baths'),
            _buildAmenityItem(Icons.car_repair_outlined, '${property.parkingSpaces} Parking'),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenityItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 8),
        Text(text, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}