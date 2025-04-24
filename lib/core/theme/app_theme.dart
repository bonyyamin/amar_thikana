import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_dimensions.dart';
import 'theme_extension.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.cardBackground,
      dividerColor: AppColors.divider,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
      ),

      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        headlineMedium: AppTextStyles.h4,
        headlineSmall: AppTextStyles.h5,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.buttonLarge,
        labelMedium: AppTextStyles.buttonMedium,
        labelSmall: AppTextStyles.buttonSmall,
      ),

      cardTheme: CardTheme(
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.inputFieldBorderRadius,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.md,
          vertical: AppDimensions.sm,
        ),
      ),

      extensions: [
        PropertyThemeExtension(
          availableColor: AppColors.available,
          rentedColor: AppColors.rented,
          maleOnlyColor: AppColors.maleOnly,
          femaleOnlyColor: AppColors.femaleOnly,
          familyOnlyColor: AppColors.familyOnly,
          priceStyle: AppTextStyles.price,
          addressStyle: AppTextStyles.bodyMedium,
          propertyTypeStyle: AppTextStyles.h5,
          amenityLabelStyle: AppTextStyles.label,
        ),
        AuthThemeExtension(
          titleStyle: AppTextStyles.h2,
          subtitleStyle: AppTextStyles.bodyLarge,
          inputLabelStyle: AppTextStyles.formLabel,
          forgotPasswordStyle: AppTextStyles.link,
          orDividerStyle: AppTextStyles.bodySmall,
          socialButtonBackground: AppColors.surface,
          formBackground: AppColors.background,
        ),
      ],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryLight,
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      dividerColor: const Color(0xFF2C2C2C),

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        surface: Color(0xFF1E1E1E),
        error: AppColors.error,
      ),

      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1.copyWith(color: Colors.white),
        displayMedium: AppTextStyles.h2.copyWith(color: Colors.white),
        displaySmall: AppTextStyles.h3.copyWith(color: Colors.white),
        headlineMedium: AppTextStyles.h4.copyWith(color: Colors.white),
        headlineSmall: AppTextStyles.h5.copyWith(color: Colors.white),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white70),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
        bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.white60),
        labelLarge: AppTextStyles.buttonLarge,
        labelMedium: AppTextStyles.buttonMedium,
        labelSmall: AppTextStyles.buttonSmall,
      ),

      cardTheme: CardTheme(
        elevation: AppDimensions.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.inputFieldBorderRadius,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.md,
          vertical: AppDimensions.sm,
        ),
      ),

      extensions: [
        PropertyThemeExtension(
          availableColor: AppColors.available,
          rentedColor: AppColors.rented,
          maleOnlyColor: AppColors.maleOnly,
          femaleOnlyColor: AppColors.femaleOnly,
          familyOnlyColor: AppColors.familyOnly,
          priceStyle: AppTextStyles.price.copyWith(
            color: AppColors.primaryLight,
          ),
          addressStyle: AppTextStyles.bodyMedium.copyWith(
            color: Colors.white70,
          ),
          propertyTypeStyle: AppTextStyles.h5.copyWith(color: Colors.white),
          amenityLabelStyle: AppTextStyles.label.copyWith(
            color: Colors.white70,
          ),
        ),
        AuthThemeExtension(
          titleStyle: AppTextStyles.h2.copyWith(color: Colors.white),
          subtitleStyle: AppTextStyles.bodyLarge.copyWith(
            color: Colors.white70,
          ),
          inputLabelStyle: AppTextStyles.formLabel.copyWith(
            color: Colors.white70,
          ),
          forgotPasswordStyle: AppTextStyles.link.copyWith(
            color: AppColors.primaryLight,
          ),
          orDividerStyle: AppTextStyles.bodySmall.copyWith(
            color: Colors.white60,
          ),
          socialButtonBackground: const Color(0xFF2C2C2C),
          formBackground: const Color(0xFF1E1E1E),
        ),
      ],
    );
  }
}
