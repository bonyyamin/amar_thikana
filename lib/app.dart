import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Amar Thikana', // Your app name
      debugShowCheckedModeBanner: false, // Disable debug banner

      // --- Theme Configuration ---
      themeMode: ThemeMode.system, // Use system theme (light/dark)
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // --- Router Configuration ---
      routerConfig: AppRouter.router,
    );
  }
}