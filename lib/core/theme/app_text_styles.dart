// lib/core/theme/app_text_styles.dart

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font families
  static const String primaryFontFamily = 'Poppins';
  static const String secondaryFontFamily = 'Inter';

  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.3,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Button text
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
    letterSpacing: 0.5,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  // Label
  static const TextStyle label = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Price
  static const TextStyle price = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.2,
  );

  // Special styles
  static const TextStyle badge = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static const TextStyle tabLabel = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  // Form field label
  static const TextStyle formLabel = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Clickable text
  static const TextStyle link = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    height: 1.5,
    decoration: TextDecoration.underline,
  );
}
