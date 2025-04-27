import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:amar_thikana/core/theme/app_text_styles.dart';

class PropertyDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PropertyDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        'Property Details',
        style: AppTextStyles.h5.copyWith(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        _buildIconButton(Icons.favorite_border, () {
          // TODO: Implement favorite functionality
        }),
        const SizedBox(width: 8),
        _buildIconButton(Icons.share, () {
          // TODO: Implement share functionality
        }),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 2),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.primaryLight),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
