import 'package:amar_thikana/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_extension.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

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
        Image.asset('assets/images/signup.png', height: 200),
        Text("Create Account", style: authTheme.titleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text("Start finding or listing properties today!", style: authTheme.subtitleStyle, textAlign: TextAlign.center),
      ],
    );
  }
}
