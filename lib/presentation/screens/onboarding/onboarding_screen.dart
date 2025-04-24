import 'package:amar_thikana/presentation/screens/onboarding/widgets/diamond_button.dart';
import 'package:amar_thikana/presentation/screens/onboarding/widgets/dot_indicator.dart';
import 'package:amar_thikana/presentation/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:amar_thikana/core/theme/onboarding_theme_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Welcome to \nAmar Thikana',
      description: 'Find your perfect home with ease',
      image: 'assets/images/onboarding/onboarding1.png',
    ),
    OnboardingPage(
      title: 'Search Properties',
      description: 'Explore thousands of properties in your area',
      image: 'assets/images/onboarding/onboarding2.png',
    ),
    OnboardingPage(
      title: 'Easy Booking',
      description: 'Book your desired property with just a few taps',
      image: 'assets/images/onboarding/onboarding3.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            _currentPage == 1 ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            _currentPage == 1 ? Brightness.light : Brightness.dark,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemBuilder:
                (context, index) => Container(
                  color: OnboardingThemeHelper.getPageColor(context, index),
                  child: OnboardingPageWidget(
                    page: _pages[index],
                    currentPage: _currentPage,
                  ),
                ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => context.go('/login'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color:
                            _currentPage == 1
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                      ),
                    ),
                  ),
                  DiamondButton(
                    currentPage: _currentPage,
                    totalPages: _pages.length,
                    onNext:
                        () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        ),
                  ),
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) =>
                          DotIndicator(index: index, currentPage: _currentPage),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
