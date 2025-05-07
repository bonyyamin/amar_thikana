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
import 'package:amar_thikana/presentation/screens/renter/property_details/property_details_screen.dart';
import 'package:amar_thikana/presentation/screens/landlord/property_preview/property_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_guard.dart';
import '../../../screens/splash/splash_screen.dart';
import '../../../screens/onboarding/onboarding_screen.dart';
import 'route_names.dart';
import 'package:amar_thikana/domain/models/property/property.dart';
import 'package:amar_thikana/application/providers/property/properties_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    redirect: AuthGuard.handleAuthState,
    routes: [
      // Public Routes
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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      // Renter Routes
      GoRoute(
        path: RouteNames.renterNavigation,
        builder: (context, state) => const RenterNavigationBar(),
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => const RenterHomeScreen(),
          ),
          GoRoute(
            path: 'property/:id',
            builder: (context, state) {
              final propertyId = state.pathParameters['id']!;
              return PropertyDetailsScreen(
                property: getPropertyById(propertyId),
              ); // Pass property object
            },
          ),
        ],
      ),

      // Landlord Routes
      GoRoute(
        path: RouteNames.landlordNavigation,
        builder: (context, state) => const LandlordNavigationBar(),
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => const LandlordHomeScreen(),
          ),
          GoRoute(
            path: 'property/add',
            builder: (context, state) => const PropertyForm(),
          ),
          GoRoute(
            path: 'property/:id/edit',
            builder: (context, state) {
              final propertyId = state.pathParameters['id']!;
              return EditPropertyScreen(propertyId: propertyId);
            },
          ),
          GoRoute(
            path: 'property/:id',
            builder: (context, state) {
              final propertyId = state.pathParameters['id']!;
              return PropertyDetailsScreen(
                property: getPropertyById(propertyId),
              ); // Pass property object
            },
          ),
          GoRoute(
            path: 'property/:id/preview',
            builder: (context, state) {
              final propertyId = state.pathParameters['id']!;
              return PropertyPreviewScreen(propertyId: propertyId);
            },
          ),
          GoRoute(
            path: 'listings',
            builder: (context, state) => const MyListingsScreen(),
          ),
        ],
      ),
    ],
  );

  // Helper method to get property by ID
  static Property getPropertyById(String id) {
    final container = ProviderContainer();
    final propertiesAsync = container.read(propertyListProvider);

    if (propertiesAsync case AsyncData(:final value)) {
      return value.firstWhere(
        (p) => p.id == id,
        orElse: () => throw Exception('Property not found'),
      );
    }

    throw Exception('Properties not loaded');
  }
}
