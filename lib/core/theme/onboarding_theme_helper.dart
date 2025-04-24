import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';

class OnboardingThemeHelper {
  static Color getPageColor(BuildContext context, int pageIndex) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (pageIndex) {
      case 0:
        return isDark ? const Color(0xFF1A1A2E) : const Color(0xFF192F59);
      case 1:
        return isDark ? const Color(0xFF162447) : const Color(0xFFFFFFFF);
      case 2:
        return isDark ? const Color(0xFF1B1B2F) : const Color(0xFFED8936);
      default:
        return Theme.of(context).scaffoldBackgroundColor;
    }
  }

  static Color getDotActiveColor(BuildContext context, int currentPage) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) return Theme.of(context).colorScheme.primary;

    switch (currentPage) {
      case 0:
      case 2:
        return Colors.white;
      case 1:
        return AppColors.primary;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  static Color getDiamondButtonColor(BuildContext context, int currentPage) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) return Theme.of(context).colorScheme.surface;

    switch (currentPage) {
      case 0:
      case 2:
        return Colors.white;
      case 1:
        return AppColors.primary;
      default:
        return Theme.of(context).colorScheme.surface;
    }
  }

  static Color getDiamondIconColor(BuildContext context, int currentPage) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (isDark) return Theme.of(context).colorScheme.primary;

    switch (currentPage) {
      case 0:
      case 2:
        return AppColors.primary;
      case 1:
        return Colors.white;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
