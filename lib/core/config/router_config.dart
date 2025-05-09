import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/screens/navigation/router/app_router.dart';

/// Router configuration provider
/// This provider exposes the GoRouter instance to be used throughout the app
final routerProvider = Provider<GoRouter>((ref) {
  return AppRouter.router;
});

/// Configuration class for router-related settings
class RouterConfig {
  /// Default transition duration for page transitions
  static const Duration defaultTransitionDuration = Duration(milliseconds: 300);
  
  /// Default transition curve for page transitions
  static const defaultTransitionCurve = Curves.easeInOut;
  
  /// Whether to show debug logs for router
  static const bool enableRouterLogs = true;
  
  /// Configuration for different route types
  static const Map<String, RouteConfig> routeConfigs = {
    'default': RouteConfig(
      transitionDuration: defaultTransitionDuration,
      transitionCurve: defaultTransitionCurve,
    ),
    'fade': RouteConfig(
      transitionDuration: Duration(milliseconds: 200),
      transitionCurve: Curves.easeIn,
    ),
    'slide': RouteConfig(
      transitionDuration: Duration(milliseconds: 350),
      transitionCurve: Curves.easeOutQuart,
    ),
  };
}

/// Configuration for individual route types
class RouteConfig {
  final Duration transitionDuration;
  final Curve transitionCurve;

  const RouteConfig({
    required this.transitionDuration,
    required this.transitionCurve,
  });
}