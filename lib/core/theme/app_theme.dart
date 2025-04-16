import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define a seed color - Material 3 will generate palettes from this
  static const Color _seedColor = Colors.blue; // Choose your primary brand color

  // --- Light Theme ---
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );

    final textTheme = _buildTextTheme(baseTextTheme: GoogleFonts.sourceSans3TextTheme(ThemeData.light().textTheme), colorScheme: colorScheme);


    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      // Add other theme customizations here (AppBarTheme, ButtonTheme, CardTheme, etc.)
      // Example:
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface, // Or surfaceContainerHighest etc.
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardTheme(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
        ),
         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
         clipBehavior: Clip.antiAlias,
      ),
       listTileTheme: ListTileThemeData(
         iconColor: colorScheme.primary,
       ),
       inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
         filled: true,
         fillColor: colorScheme.surfaceContainerHighest, // Adjust as needed
         contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
       ),
       filledButtonTheme: FilledButtonThemeData(
         style: FilledButton.styleFrom(
           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
         ),
       ),
    );
  }

  // --- Dark Theme ---
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark, // Important: Set brightness to dark
    );

    final textTheme = _buildTextTheme(baseTextTheme: GoogleFonts.sourceSans3TextTheme(ThemeData.dark().textTheme), colorScheme: colorScheme);


    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      // Add dark theme specific customizations or overrides
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface, // Or surfaceContainerHighest etc.
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
         titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardTheme(
        elevation: 1,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
           side: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
        ),
         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
         clipBehavior: Clip.antiAlias,
      ),
       listTileTheme: ListTileThemeData(
         iconColor: colorScheme.primary,
       ),
      inputDecorationTheme: InputDecorationTheme(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
         filled: true,
         fillColor: colorScheme.surfaceContainerHighest, // Adjust as needed
         contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
       ),
        filledButtonTheme: FilledButtonThemeData(
         style: FilledButton.styleFrom(
           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
         ),
       ),
    );
  }

  // --- Text Theme Builder ---
  // Allows applying consistent color from ColorScheme to GoogleFonts
   static TextTheme _buildTextTheme({required TextTheme baseTextTheme, required ColorScheme colorScheme}) {
    return baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(color: colorScheme.onSurface),
      displayMedium: baseTextTheme.displayMedium?.copyWith(color: colorScheme.onSurface),
      displaySmall: baseTextTheme.displaySmall?.copyWith(color: colorScheme.onSurface),
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(color: colorScheme.onSurface),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(color: colorScheme.onSurface),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(color: colorScheme.onSurface),
      titleLarge: baseTextTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      titleMedium: baseTextTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
      titleSmall: baseTextTheme.titleSmall?.copyWith(color: colorScheme.onSurface),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      bodySmall: baseTextTheme.bodySmall?.copyWith(color: colorScheme.onSurface),
      labelLarge: baseTextTheme.labelLarge?.copyWith(color: colorScheme.onSurface),
      labelMedium: baseTextTheme.labelMedium?.copyWith(color: colorScheme.onSurface), // Used for buttons by default
      labelSmall: baseTextTheme.labelSmall?.copyWith(color: colorScheme.onSurface),
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}