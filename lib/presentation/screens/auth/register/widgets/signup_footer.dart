import 'package:amar_thikana/core/theme/theme_extension.dart';
import 'package:amar_thikana/presentation/screens/auth/login/widgets/social_login_buttons.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final authTheme = Theme.of(context).extension<AuthThemeExtension>()!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Or continue with", style: authTheme.orDividerStyle),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),
        const SizedBox(height: 30),
        const SocialLoginButtons(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: authTheme.subtitleStyle),
            TextButton(
              onPressed: () => context.go(RouteNames.login),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
