import 'package:flutter/material.dart';

class HorizontalSocialLoginButton extends StatelessWidget {
  const HorizontalSocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LoginButton(
          icon: Image.asset('assets/icons/google.png', height: 24, width: 24),
          text: 'Login with Google',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            // Handle Google login
          },
        ),
        const SizedBox(height: 12),
        _LoginButton(
          icon: Image.asset('assets/icons/facebook.png', height: 24, width: 24),
          text: 'Login with Facebook',
          backgroundColor: const Color(0xFF1877F2),
          textColor: Colors.white,
          onPressed: () {
            // Handle Facebook login
          },
        ),
        const SizedBox(height: 12),
        if (Theme.of(context).platform == TargetPlatform.iOS ||
            Theme.of(context).platform == TargetPlatform.macOS)
          _LoginButton(
            icon: Image.asset('assets/icons/apple.png', height: 24, width: 24),
            text: 'Login with Apple',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            onPressed: () {
              // Handle Apple login
            },
          ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _LoginButton({
    required this.icon,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
