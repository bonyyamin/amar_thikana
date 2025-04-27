import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(
          color: AppColors.divider, // Border color for the icon
          width: 2, // Border width
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ), // Adjust the radius for rounded corners
            child: Image.asset(
              'assets/images/profile.jpg', // Replace with actual profile URL from provider
              width: 48, // Adjust width as needed
              height: 48, // Adjust height as needed
              fit: BoxFit.cover, // Ensure the image fills the space properly
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Smith Doe', style: AppTextStyles.h5),
                Text(
                  'Property Owner',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(12), // Rounded corners
              border: Border.all(
                color: AppColors.divider, // Border color for the icon
                width: 2, // Border width
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.message_outlined),
              color: AppColors.textLight, // Icon color
              onPressed: () {
                // Navigate to notifications
              },
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(12), // Rounded corners
              border: Border.all(
                color: AppColors.divider, // Border color for the icon
                width: 2, // Border width
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.call),
              color: AppColors.available, // Icon color
              onPressed: () {
                // Navigate to notifications
              },
            ),
          ),
        ],
      ),
    );
  }
}
