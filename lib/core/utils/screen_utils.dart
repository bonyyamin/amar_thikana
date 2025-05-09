import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider that gives access to screen utilities
final screenUtilsProvider = Provider<ScreenUtils>((ref) {
  return ScreenUtils();
});

/// Utility class to handle screen related operations
class ScreenUtils {
  /// Returns true if the screen width is considered a mobile width
  bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  /// Returns true if the screen width is considered a tablet width
  bool isTabletScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  /// Returns true if the screen width is considered a desktop width
  bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  /// Returns the screen width
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Returns the safe area padding
  EdgeInsets getSafePadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Returns a responsive value based on screen width
  /// [mobileValue] - Value for mobile screens (< 600)
  /// [tabletValue] - Value for tablet screens (>= 600 and < 1200)
  /// [desktopValue] - Value for desktop screens (>= 1200)
  T getResponsiveValue<T>({
    required BuildContext context,
    required T mobileValue,
    T? tabletValue,
    required T desktopValue,
  }) {
    if (isDesktopScreen(context)) {
      return desktopValue;
    } else if (isTabletScreen(context)) {
      return tabletValue ?? desktopValue;
    } else {
      return mobileValue;
    }
  }

  /// Returns a responsive padding based on screen size
  EdgeInsets getResponsivePadding(BuildContext context) {
    return getResponsiveValue(
      context: context,
      mobileValue: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      tabletValue: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      desktopValue: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
    );
  }

  /// Returns a responsive font size based on screen width
  double getResponsiveFontSize(
    BuildContext context, {
    required double mobileSize,
    double? tabletSize,
    required double desktopSize,
  }) {
    return getResponsiveValue(
      context: context,
      mobileValue: mobileSize,
      tabletValue: tabletSize,
      desktopValue: desktopSize,
    );
  }

  /// Returns a responsive value based on available screen width percentage
  double getWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  /// Returns a responsive value based on available screen height percentage
  double getHeightPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  /// Shows a modal bottom sheet with responsive height
  Future<T?> showResponsiveModalBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    final height = getResponsiveValue(
      context: context,
      mobileValue: getHeightPercentage(context, 80),
      tabletValue: getHeightPercentage(context, 70),
      desktopValue: getHeightPercentage(context, 60),
    );

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ?? const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      builder: (context) => child,
    );
  }

  /// Orientation utility - returns true if device is in landscape mode
  bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Get status bar height
  double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Utility function to determine if keyboard is visible
  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}