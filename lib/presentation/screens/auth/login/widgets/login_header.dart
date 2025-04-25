import 'package:flutter/material.dart';
import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/theme_extension.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authTheme = theme.extension<AuthThemeExtension>()!;

    return Column(
      children: [
        Image.asset(
          AssetConstants.logo,
          height: 80,

        ),
        const SizedBox(height: 20),

        Image.asset('assets/images/login.png', height: 200),
        const SizedBox(height: 30),
        Text(
          "Welcome Back!",
          style: authTheme.titleStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Log in to continue your search",
          style: authTheme.subtitleStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
