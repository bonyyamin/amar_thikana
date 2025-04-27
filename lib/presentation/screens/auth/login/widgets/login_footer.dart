import 'package:amar_thikana/presentation/common_widgets/buttons/horizontal_social_login_button.dart';
import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/theme_extension.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

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
        const SizedBox(height: 15),
        const HorizontalSocialLoginButton(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?", style: authTheme.subtitleStyle),
            TextButton(
              onPressed: () => context.go(RouteNames.signUp),
              child: Text(
                "Sign Up",
                style: authTheme.subtitleStyle.copyWith(
                  color: authTheme.signUpColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          text: "Continue as Guest (Renter)",
          onPressed: () => context.go(RouteNames.renterNavigation),
          backgroundColor: authTheme.signUpColor,
          textColor: Colors.white,
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          text: "Continue as Guest (LandLord)",
          onPressed: () => context.go(RouteNames.landlordNavigation),
          backgroundColor: authTheme.signUpColor,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
