import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';
import 'package:amar_thikana/presentation/screens/common/notifications/notification_screen.dart';
import 'package:amar_thikana/presentation/screens/common/notifications/notifications_screen2.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(12), // Rounded corners
            border: Border.all(
              color: AppColors.divider, // Border color for the icon
              width: 2, // Border width
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_none),
            color: AppColors.primaryLight, // Icon color
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
