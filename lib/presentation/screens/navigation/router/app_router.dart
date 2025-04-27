import 'package:amar_thikana/presentation/screens/auth/login/login_screen.dart';
import 'package:amar_thikana/presentation/screens/auth/register/signup_screen.dart';
import 'package:amar_thikana/presentation/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:amar_thikana/presentation/screens/landlord/dashboard/landlord_home_screen.dart';
import 'package:amar_thikana/presentation/screens/landlord/listings/my_listings_screen.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/add_property_screen.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_form/edit_property_screen.dart';
import 'package:amar_thikana/presentation/screens/navigation/navigation_bar/landlord_navigation_bar.dart';
import 'package:amar_thikana/presentation/screens/navigation/navigation_bar/renter_navigation_bar.dart';
import 'package:amar_thikana/presentation/screens/renter/home/renter_home_screen.dart';
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
        path: RouteNames.renterNavigation,
        builder: (context, state) => const RenterNavigationBar(),
      ),
      GoRoute(
        path: RouteNames.renterHome,
        builder: (context, state) => const RenterHomeScreen(),
      ),
      GoRoute(
        path: RouteNames.landlordNavigation,
        builder: (context, state) => const LandlordNavigationBar(),
      ),
      GoRoute(
        path: RouteNames.landlordHome,
        builder: (context, state) => const LandlordHomeScreen(),
      ),
      GoRoute(
        path: RouteNames.addProperty,
        builder: (context, state) => const PropertyForm(),
      ),
      GoRoute(
        path: RouteNames.editProperty,
        builder: (context, state) {
          final propertyId = state.pathParameters['id'] ?? '';
          return EditPropertyScreen(propertyId: propertyId);
        },
      ),
      GoRoute(
        path: RouteNames.myListings,
        builder: (context, state) => const MyListingsScreen(),
      ),
    ],
  );
}
