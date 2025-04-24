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
      final notifier = ref.read(authNotifierProvider.notifier);
      await notifier.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final state = ref.read(authNotifierProvider);
      if (state.errorMessage != null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authTheme = theme.extension<AuthThemeExtension>()!;
    final state = ref.watch(authNotifierProvider);

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
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go(RouteNames.forgotPassword),
              child: Text(
                "Forgot Password?",
                style: authTheme.forgotPasswordStyle,
              ),
            ),
          ),
          const SizedBox(height: 25),
          state.isLoading
              ? const CircularLoader()
              : ElevatedButton(
                onPressed: _onLoginPressed,
                child: const Text("Login"),
              ),
        ],
      ),
    );
  }
}
