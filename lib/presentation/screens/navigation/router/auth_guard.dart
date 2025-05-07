import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../application/providers/auth/auth_providers.dart';
import '../../../../domain/models/user/user_role.dart';
import 'route_names.dart';

class AuthGuard {
  static String? handleAuthState(BuildContext context, GoRouterState state) {
    final container = ProviderScope.containerOf(context);
    final authState = container.read(authStateProvider);

    final isPublicRoute =
        state.matchedLocation == RouteNames.splash ||
        state.matchedLocation == RouteNames.onboarding ||
        state.matchedLocation == RouteNames.login ||
        state.matchedLocation == RouteNames.signUp ||
        state.matchedLocation == RouteNames.forgotPassword;

    return switch (authState) {
      AsyncData(:final value) =>
        isPublicRoute
            ? (value.userType == UserRole.landlord
                ? RouteNames.landlordNavigation
                : RouteNames.renterNavigation)
            : null,
      AsyncError() => RouteNames.login,
      _ => null, // Loading state, allow current route
    };
  }
}
