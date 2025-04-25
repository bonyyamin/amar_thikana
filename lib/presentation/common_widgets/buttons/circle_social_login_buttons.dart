import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amar_thikana/application/providers/auth/auth_providers.dart';

class CircleSocialLoginButtons extends ConsumerWidget {
  const CircleSocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          icon: FontAwesomeIcons.google,
          color: Colors.redAccent,
          onPressed: () => authNotifier.loginWithGoogle(),
        ),
        const SizedBox(width: 20),
        _buildIconButton(
          icon: FontAwesomeIcons.facebookF,
          color: Colors.blue.shade800,
          onPressed: () => authNotifier.loginWithFacebook(),
        ),
        const SizedBox(width: 20),
        if (Theme.of(context).platform == TargetPlatform.iOS ||
            Theme.of(context).platform == TargetPlatform.macOS)
          _buildIconButton(
            icon: FontAwesomeIcons.apple,
            color: Colors.black,
            onPressed: () => authNotifier.loginWithApple(),
          ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
