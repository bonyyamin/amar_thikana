// lib/core/theme/theme_extension.dart

import 'package:flutter/material.dart';

// Custom theme extension for property-specific styles
class PropertyThemeExtension extends ThemeExtension<PropertyThemeExtension> {
  final Color availableColor;
  final Color rentedColor;
  final Color maleOnlyColor;
  final Color femaleOnlyColor;
  final Color familyOnlyColor;
  final TextStyle priceStyle;
  final TextStyle addressStyle;
  final TextStyle propertyTypeStyle;
  final TextStyle amenityLabelStyle;

  PropertyThemeExtension({
    required this.availableColor,
    required this.rentedColor,
    required this.maleOnlyColor,
    required this.femaleOnlyColor,
    required this.familyOnlyColor,
    required this.priceStyle,
    required this.addressStyle,
    required this.propertyTypeStyle,
    required this.amenityLabelStyle,
  });

  @override
  PropertyThemeExtension copyWith({
    Color? availableColor,
    Color? rentedColor,
    Color? maleOnlyColor,
    Color? femaleOnlyColor,
    Color? familyOnlyColor,
    TextStyle? priceStyle,
    TextStyle? addressStyle,
    TextStyle? propertyTypeStyle,
    TextStyle? amenityLabelStyle,
  }) {
    return PropertyThemeExtension(
      availableColor: availableColor ?? this.availableColor,
      rentedColor: rentedColor ?? this.rentedColor,
      maleOnlyColor: maleOnlyColor ?? this.maleOnlyColor,
      femaleOnlyColor: femaleOnlyColor ?? this.femaleOnlyColor,
      familyOnlyColor: familyOnlyColor ?? this.familyOnlyColor,
      priceStyle: priceStyle ?? this.priceStyle,
      addressStyle: addressStyle ?? this.addressStyle,
      propertyTypeStyle: propertyTypeStyle ?? this.propertyTypeStyle,
      amenityLabelStyle: amenityLabelStyle ?? this.amenityLabelStyle,
    );
  }

  @override
  ThemeExtension<PropertyThemeExtension> lerp(
    covariant ThemeExtension<PropertyThemeExtension>? other,
    double t,
  ) {
    if (other is! PropertyThemeExtension) {
      return this;
    }
    return PropertyThemeExtension(
      availableColor: Color.lerp(availableColor, other.availableColor, t)!,
      rentedColor: Color.lerp(rentedColor, other.rentedColor, t)!,
      maleOnlyColor: Color.lerp(maleOnlyColor, other.maleOnlyColor, t)!,
      femaleOnlyColor: Color.lerp(femaleOnlyColor, other.femaleOnlyColor, t)!,
      familyOnlyColor: Color.lerp(familyOnlyColor, other.familyOnlyColor, t)!,
      priceStyle: TextStyle.lerp(priceStyle, other.priceStyle, t)!,
      addressStyle: TextStyle.lerp(addressStyle, other.addressStyle, t)!,
      propertyTypeStyle:
          TextStyle.lerp(propertyTypeStyle, other.propertyTypeStyle, t)!,
      amenityLabelStyle:
          TextStyle.lerp(amenityLabelStyle, other.amenityLabelStyle, t)!,
    );
  }
}

// Custom theme extension for authentication screens
class AuthThemeExtension extends ThemeExtension<AuthThemeExtension> {
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle inputLabelStyle;
  final TextStyle forgotPasswordStyle;
  final TextStyle orDividerStyle;
  final Color socialButtonBackground;
  final Color formBackground;
  final Color forgotPasswordColor;
  final Color signUpColor;

  AuthThemeExtension({
    required this.titleStyle,
    required this.subtitleStyle,
    required this.inputLabelStyle,
    required this.forgotPasswordStyle,
    required this.orDividerStyle,
    required this.socialButtonBackground,
    required this.formBackground,
    required this.forgotPasswordColor,
    required this.signUpColor,
  });

  @override
  AuthThemeExtension copyWith({
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? inputLabelStyle,
    TextStyle? forgotPasswordStyle,
    TextStyle? orDividerStyle,
    Color? socialButtonBackground,
    Color? formBackground,
    Color? forgotPasswordColor,
    Color? signUpColor,
  }) {
    return AuthThemeExtension(
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      inputLabelStyle: inputLabelStyle ?? this.inputLabelStyle,
      forgotPasswordStyle: forgotPasswordStyle ?? this.forgotPasswordStyle,
      orDividerStyle: orDividerStyle ?? this.orDividerStyle,
      socialButtonBackground:
          socialButtonBackground ?? this.socialButtonBackground,
      formBackground: formBackground ?? this.formBackground,
      forgotPasswordColor: forgotPasswordColor ?? this.forgotPasswordColor,
      signUpColor: signUpColor ?? this.signUpColor,
    );
  }

  @override
  ThemeExtension<AuthThemeExtension> lerp(
    covariant ThemeExtension<AuthThemeExtension>? other,
    double t,
  ) {
    if (other is! AuthThemeExtension) {
      return this;
    }
    return AuthThemeExtension(
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t)!,
      inputLabelStyle:
          TextStyle.lerp(inputLabelStyle, other.inputLabelStyle, t)!,
      forgotPasswordStyle:
          TextStyle.lerp(forgotPasswordStyle, other.forgotPasswordStyle, t)!,
      orDividerStyle: TextStyle.lerp(orDividerStyle, other.orDividerStyle, t)!,
      socialButtonBackground:
          Color.lerp(socialButtonBackground, other.socialButtonBackground, t)!,
      formBackground: Color.lerp(formBackground, other.formBackground, t)!,
      forgotPasswordColor:
          Color.lerp(forgotPasswordColor, other.forgotPasswordColor, t)!,
      signUpColor: Color.lerp(signUpColor, other.signUpColor, t)!,
    );
  }
}
