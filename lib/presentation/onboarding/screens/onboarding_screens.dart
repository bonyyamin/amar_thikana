// Define your onboarding content
import 'package:amar_thikana/presentation/onboarding/application/onboarding_providers.dart';
import 'package:amar_thikana/presentation/onboarding/screens/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingInfo {
  final String imagePath;
  final String title;
  final String description;

  OnboardingInfo({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingInfo> onboardingPages = [
  OnboardingInfo(
    imagePath:
        'assets/images/onboarding/onboarding_1.png', // Replace with your asset paths
    title: 'Find Your Perfect Place',
    description:
        'Search thousands of listings for homes, apartments, hostels, and seats near you.',
  ),
  OnboardingInfo(
    imagePath: 'assets/images/onboarding/onboarding_2.png',
    title: 'Variety of Choices',
    description:
        'From single rooms to full apartments or mess seats, find exactly what fits your needs.',
  ),
  OnboardingInfo(
    imagePath: 'assets/images/onboarding/onboarding_3.png',
    title: 'Connect Directly',
    description:
        'Chat securely with landlords and managers right within the app.',
  ),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Function to mark onboarding complete and navigate
  Future<void> _completeOnboarding() async {
    final repository = ref.read(onboardingRepositoryProvider);
    await repository.setOnboardingComplete();
    if (mounted) {
      // Navigate to login screen after onboarding is done
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingPages.length,
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == onboardingPages.length - 1;
              });
            },
            itemBuilder: (context, index) {
              final pageInfo = onboardingPages[index];
              return OnboardingPageWidget(
                imagePath: pageInfo.imagePath,
                title: pageInfo.title,
                description: pageInfo.description,
              );
            },
          ),

          // Skip Button (Top Right)
          Positioned(
            top: kToolbarHeight, // Align with typical AppBar height
            right: 20,
            child: TextButton(
              onPressed: _completeOnboarding, // Skip action
              child: const Text('Skip'),
            ),
          ),

          // Indicator and Next/Done Button (Bottom)
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardingPages.length,
                  effect: WormEffect(
                    // Choose your desired effect
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: colorScheme.primary,
                    dotColor: colorScheme.outlineVariant,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),

                // Next / Done Button
                FilledButton(
                  onPressed: () {
                    if (_isLastPage) {
                      _completeOnboarding(); // Done action
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(_isLastPage ? 'Done' : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
