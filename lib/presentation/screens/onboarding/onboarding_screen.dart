import 'package:amar_thikana/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

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
      title: 'Welcome to Amar Thikana',
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

  Color _getPageColor(BuildContext context, int pageIndex) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    switch (pageIndex) {
      case 0:
        return isDarkMode ? const Color(0xFF1A1A2E) : const Color(0xFF192F59);
      case 1:
        return isDarkMode ? const Color(0xFF162447) : const Color(0xFFFFFFFF);
      case 2:
        return isDarkMode ? const Color(0xFF1B1B2F) : const Color(0xFFED8936);
      default:
        return Theme.of(context).scaffoldBackgroundColor;
    }
  }

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
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return Container(
                color: _getPageColor(context, index),
                child: _buildPage(_pages[index]),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: () => context.go('/login'),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color:
                                _currentPage == 1
                                    ? AppColors.primary
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    _buildDiamondButton(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: List.generate(
                          _pages.length,
                          (index) => _buildDot(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = _currentPage == index;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getActiveColor() {
      if (isDarkMode) return Theme.of(context).colorScheme.primary;
      switch (_currentPage) {
        case 0:
        case 2:
          return Colors.white;
        case 1:
          return AppColors.primary;
        default:
          return Theme.of(context).colorScheme.primary;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color:
            isActive
                ? getActiveColor()
                : (isDarkMode ? Colors.white38 : Colors.black38),
      ),
    );
  }

  Widget _buildDiamondButton() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getButtonColor() {
      if (isDarkMode) return Theme.of(context).colorScheme.surface;
      switch (_currentPage) {
        case 0:
        case 2:
          return Colors.white;
        case 1:
          return AppColors.primary;
        default:
          return Theme.of(context).colorScheme.surface;
      }
    }

    Color getIconColor() {
      if (isDarkMode) return Theme.of(context).colorScheme.primary;
      switch (_currentPage) {
        case 0:
        case 2:
          return AppColors.primary;
        case 1:
          return Colors.white;
        default:
          return Theme.of(context).colorScheme.primary;
      }
    }

    return Transform.rotate(
      angle: math.pi / 4,
      child: GestureDetector(
        onTap: () {
          if (_currentPage == _pages.length - 1) {
            context.go('/login');
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: getButtonColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: Icon(
              _currentPage == _pages.length - 1
                  ? Icons.check
                  : Icons.arrow_forward_ios,
              color: getIconColor(),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getTextColor() {
      if (isDarkMode) return Colors.white;
      switch (_currentPage) {
        case 0:
        case 2:
          return Colors.white;
        case 1:
          return AppColors.textPrimary;
        default:
          return AppColors.textPrimary;
      }
    }

    Color getDescriptionColor() {
      if (isDarkMode) return Colors.white70;
      switch (_currentPage) {
        case 0:
        case 2:
          return Colors.white70;
        case 1:
          return Colors.black54;
        default:
          return Colors.black54;
      }
    }

    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          page.title,
          style: textTheme.headlineMedium?.copyWith(color: getTextColor()),
        ),
        const SizedBox(height: 15),
        Text(
          page.description,
          style: textTheme.bodyMedium?.copyWith(color: getDescriptionColor()),
        ),
      ],
    );

    Widget imageContent = Image.asset(
      page.image,
      height: 300,
      fit: BoxFit.contain,
    );

    switch (_currentPage) {
      case 0:
        // First page: Image top-left, text below-left
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.topLeft, child: imageContent),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: textContent,
              ),
            ],
          ),
        );

      case 1:
        // Second page: Image middle-right, text top-left
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Stack(
            children: [
              Positioned(top: 40, left: 0, right: 150, child: textContent),
              Align(alignment: Alignment.centerRight, child: imageContent),
            ],
          ),
        );

      case 2:
        // Third page: Image top-left, text middle-center
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft, child: imageContent),
              const Spacer(),
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
