import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/navigation/router/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return MaterialApp.router(
      title: 'Amar Thikana',
      debugShowCheckedModeBanner: false,
      // --- Theme Configuration ---
      themeMode: ThemeMode.system,
      theme: AppTheme.light(), // Fixed: using light() method
      darkTheme: AppTheme.dark(), // Fixed: using dark() method
      // --- Router Configuration ---
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            // Use maybeWhen with explicit <bool>
            if (authState.maybeWhen<bool>(
              (user, isEmailVerified, isOnboardingComplete, errorMessage) =>
                  false,
              loading: () => true,
              orElse: () => false,
            ))
              const ColoredBox(
                color: Colors.black54,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        );
      },
    );
  }
}
