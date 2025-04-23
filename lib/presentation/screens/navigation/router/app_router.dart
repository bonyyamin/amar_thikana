import 'package:amar_thikana/presentation/onboarding/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amar_thikana/presentation/onboarding/screens/splash_screen.dart';
// Import placeholder screens later
// import '../../features/home/presentation/screens/home_screen.dart';
// import '../../features/auth/presentation/screens/login_screen.dart';

// Simple placeholder screen for now
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title - Coming Soon!')),
    );
  }
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash', // Start with a splash/loading screen maybe?
    debugLogDiagnostics: true, // Log routing information in debug mode
    routes: [
      // TODO: Add a real splash screen later that handles initialization/auth checks
      GoRoute(
        path: '/splash',
        builder:
            (context, state) =>
                const SplashScreen(), // Use your real splash screen
      ),
      GoRoute(
        // Add this route
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home', // Your main screen after login/setup
        builder:
            (context, state) => const PlaceholderScreen(title: 'Home Screen'),
      ),
      GoRoute(
        path: '/login',
        builder:
            (context, state) => const PlaceholderScreen(title: 'Login Screen'),
      ),
      // Add other basic routes like /settings etc. as placeholders
    ],
    // TODO: Add error handling (e.g., errorBuilder to show a 404 page)
    // errorBuilder: (context, state) => ErrorScreen(error: state.error),

    // TODO: Add redirection logic later (e.g., check auth state)
    // redirect: (context, state) {
    //   // Implement auth checks here
    //   return null; // Returning null means no redirect
    // },
  );
}
