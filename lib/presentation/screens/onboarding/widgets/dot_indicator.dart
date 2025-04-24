import 'package:flutter/material.dart';
import 'package:amar_thikana/core/theme/onboarding_theme_helper.dart';

class DotIndicator extends StatelessWidget {
  final int index;
  final int currentPage;

  const DotIndicator({
    super.key,
    required this.index,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentPage == index;
    final color = isActive
        ? OnboardingThemeHelper.getDotActiveColor(context, currentPage)
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.white38
            : Colors.black38;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
    );
  }
}
