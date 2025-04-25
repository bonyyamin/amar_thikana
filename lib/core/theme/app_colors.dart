// lib/core/theme/app_colors.dart

import 'package:flutter/material.dart';

class AppColors {
  // Primary color palette
  static const Color primary = Color(0xFF192F59); // Deep blue
  static const Color primaryLight = Color(0xFF5078E1); // Lighter blue
  static const Color primaryDark = Color(0xFF1A365D); // Darker blue

  // Secondary color palette
  static const Color secondary = Color(0xFFED8936); // Orange
  static const Color secondaryLight = Color(0xFFFBD38D); // Light orange
  static const Color secondaryDark = Color(0xFFC05621); // Dark orange

  // Neutral colors
  static const Color background = Color(0xFFFAFAFA); // Off-white background
  static const Color surface = Color(0xFFFFFFFF); // White surface
  static const Color cardBackground = Color(0xFFFFFFFF); // Card background

  // Text colors
  static const Color textPrimary = Color(
    0xFF1A202C,
  ); // Very dark gray - almost black
  static const Color textSecondary = Color(0xFF4A5568); // Dark gray
  static const Color textTertiary = Color(0xFF718096); // Medium gray
  static const Color textLight = Color(0xFFA0AEC0); // Light gray

  // Functional colors
  static const Color success = Color(0xFF48BB78); // Green
  static const Color warning = Color(0xFFECC94B); // Yellow
  static const Color error = Color(0xFFE53E3E); // Red
  static const Color info = Color(0xFF4299E1); // Blue

  // Other UI colors
  static const Color divider = Color(0xFFEFF2FC); // Very light gray
  static const Color disabled = Color(0xFFE2E8F0); // Light gray
  static const Color shadow = Color(0x1A000000); // Black with 10% opacity

  // Feature-specific colors
  static const Color available = Color(
    0xFF48BB78,
  ); // Green for available properties
  static const Color rented = Color(0xFFE53E3E); // Red for rented properties
  static const Color verified = Color(
    0xFF4299E1,
  ); // Blue for verified users/properties
  static const Color favorite = Color(0xFFE53E3E); // Red for favorites/hearts

  // Gender-based colors (for gender-specific accommodations)
  static const Color maleOnly = Color(
    0xFF4299E1,
  ); // Blue for male-only accommodations
  static const Color femaleOnly = Color(
    0xFFED64A6,
  ); // Pink for female-only accommodations
  static const Color familyOnly = Color(
    0xFF48BB78,
  ); // Green for family accommodations

  // Map colors
  static const Color mapMarker = Color(0xFF192F59); // Blue for map markers
  static const Color mapSelected = Color(
    0xFFED8936,
  ); // Orange for selected map marker
}
