import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:amar_thikana/core/theme/app_colors.dart';

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  final int currentPage;

  const OnboardingPageWidget({
    Key? key,
    required this.page,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getTextColor() {
      if (isDarkMode) return Colors.white;
      if (currentPage == 1) return AppColors.textPrimary;
      return Colors.white;
    }

    Color getDescriptionColor() {
      if (isDarkMode) return Colors.white70;
      if (currentPage == 1) return Colors.black54;
      return Colors.white70;
    }

    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(page.title,
            style: textTheme.displayLarge?.copyWith(color: getTextColor())),
        const SizedBox(height: 15),
        Text(page.description,
            style: textTheme.titleLarge?.copyWith(color: getDescriptionColor())),
      ],
    );

    Widget imageContent = Image.asset(page.image, height: 450, fit: BoxFit.contain);

    switch (currentPage) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topLeft, child: imageContent),
              const SizedBox(height: 30),
              Padding(padding: const EdgeInsets.only(right: 40), child: textContent),
            ],
          ),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Stack(
            children: [
              Positioned(top: 40, left: 0, right: 100, child: textContent),
              Align(alignment: Alignment.centerRight, child: imageContent),
            ],
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: imageContent),
              const SizedBox(height: 30),
              Center(child: textContent),
              const Spacer(),
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [imageContent, const SizedBox(height: 30), textContent],
          ),
        );
    }
  }
}
