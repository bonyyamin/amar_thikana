import 'package:amar_thikana/features/application/auth_providers.dart';
import 'package:amar_thikana/features/onboarding/application/onboarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAppAndNavigate();
  }

  Future<void> _initializeAppAndNavigate() async {
    // --- Simulate Initialization/Branding Delay ---
    await Future.delayed(const Duration(seconds: 2)); // Keep this for branding

    // --- Check Onboarding Status FIRST ---
    // Use the repository directly or the FutureProvider
    final onboardingRepository = ref.read(onboardingRepositoryProvider);
    final bool onboardingComplete = await onboardingRepository.isOnboardingComplete();

    // Ensure widget is still mounted before navigating
    if (!mounted) return;

    if (!onboardingComplete) {
      // Onboarding not done, navigate there
      context.go('/onboarding');
      return; // Stop further checks
    }

    // --- Onboarding is Complete, NOW Check Auth State ---
    final user = ref.read(currentUserProvider);

    // Ensure widget is still mounted again (though less critical here after short delay)
    if (!mounted) return;

    if (user != null) {
      context.go('/home'); // Go to Home if logged in
    } else {
      context.go('/login'); // Go to Login if not logged in
    }
  }

   @override
  Widget build(BuildContext context) {
    // Simple Splash Screen UI (Keep UI as is or refine)
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100), // Placeholder Logo
            const SizedBox(height: 24),
            Text(
              'Basatong',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
