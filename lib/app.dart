import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/navigation/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Amar Thikana',
      debugShowCheckedModeBanner: false,
      // --- Theme Configuration ---
      themeMode: ThemeMode.system,
      theme: AppTheme.light(),  // Fixed: using light() method
      darkTheme: AppTheme.dark(), // Fixed: using dark() method

      // --- Router Configuration ---
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return child!;
      },
    );
  }
}
