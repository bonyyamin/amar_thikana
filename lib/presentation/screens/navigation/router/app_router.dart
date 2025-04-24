import 'package:amar_thikana/presentation/screens/auth/login/login_screen.dart';
import 'package:amar_thikana/presentation/screens/auth/register/signup_screen.dart';
import 'package:amar_thikana/presentation/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../screens/splash/splash_screen.dart';
import '../../../screens/onboarding/onboarding_screen.dart';
import 'route_names.dart';

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
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder:
            (context, state) =>
                const LoginScreen(), // Placeholder for Login Screen
      ),
      GoRoute(
        path: RouteNames.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        builder:
            (context, state) => const PlaceholderScreen(title: 'Home Screen'),
      ),
    ],
  );
}
