import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../application/providers/auth/auth_providers.dart';
import '../../../../../core/theme/theme_extension.dart';
import '../../../../../presentation/common_widgets/loaders/circular_loader.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final notifier = ref.read(authStateNotifierProvider.notifier);
        final success = await notifier.login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (success && mounted) {
          // Login successful, navigation will be handled by auth state changes
          return;
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authTheme = theme.extension<AuthThemeExtension>()!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email Address",
              prefixIcon: const Icon(Icons.alternate_email),
              labelStyle: authTheme.inputLabelStyle,
            ),
            validator:
                (value) =>
                    value == null ||
                            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
                        ? 'Enter valid email'
                        : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock_outline),
              labelStyle: authTheme.inputLabelStyle,
            ),
            validator:
                (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go(RouteNames.forgotPassword),
              child: Text(
                "Forgot Password?",
                style: authTheme.forgotPasswordStyle.copyWith(
                  color: authTheme.forgotPasswordColor,
                  decoration: TextDecoration.underline,
                  decorationColor: authTheme.forgotPasswordColor,
                  decorationThickness: 1,
                  height: 1.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authStateNotifierProvider);

              return authState.map(
                loading: (_) => const CircularLoader(),
                authenticated: (_) => const SizedBox(),
                unauthenticated:
                    (_) => PrimaryButton(
                      text: "Login",
                      onPressed: _onLoginPressed,
                    ),
                error:
                    (error) => Column(
                      children: [
                        if (error.message.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              error.message,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        PrimaryButton(
                          text: "Login",
                          onPressed: _onLoginPressed,
                        ),
                      ],
                    ),
                (_) => PrimaryButton(text: "Login", onPressed: _onLoginPressed),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
