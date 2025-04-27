import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';

class LandlordHeader extends StatelessWidget {
  const LandlordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/profile.jpg',
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi,',
                style: TextStyle(fontSize: 16, color: AppColors.textLight),
              ),
              Text(
                'Mahmudul Hasan',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider, width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_none),
            color: AppColors.primaryLight,
            onPressed: () {
              // Navigate to notifications
            },
          ),
        ),
      ],
    );
  }
}
