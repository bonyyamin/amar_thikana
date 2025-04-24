import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amar_thikana/core/theme/onboarding_theme_helper.dart';

class DiamondButton extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;

  const DiamondButton({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: GestureDetector(
        onTap: () {
          if (currentPage == totalPages - 1) {
            context.go('/login');
          } else {
            onNext();
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: OnboardingThemeHelper.getDiamondButtonColor(context, currentPage),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Icon(
              currentPage == totalPages - 1 ? Icons.check : Icons.arrow_forward_ios,
              color: OnboardingThemeHelper.getDiamondIconColor(context, currentPage),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
