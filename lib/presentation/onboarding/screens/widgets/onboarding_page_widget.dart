import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3, // Adjust flex factor as needed
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // Adjust fit
            ),
          ),
          const SizedBox(height: 48),
          Flexible(
            flex: 2, // Adjust flex factor as needed
            child: Column(
                children: [
                     Text(
                        title,
                        style: textTheme.headlineSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                        description,
                        style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant, // Slightly muted color
                        ),
                        textAlign: TextAlign.center,
                    ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}