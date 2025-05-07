import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:amar_thikana/domain/models/user/user_role.dart';
import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/common_widgets/loaders/circular_loader.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'user_type_selector.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserRole _selectedRole = UserRole.renter;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onSignupPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final notifier = ref.read(authStateNotifierProvider.notifier);
        final success = await notifier.register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          name: _nameController.text.trim(),
          userType: _selectedRole.name,
        );

        if (success && mounted) {
          context.go(RouteNames.login);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully registered! Please login.'),
              backgroundColor: Colors.green,
            ),
          );
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Full Name",
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator:
                (val) => val == null || val.isEmpty ? 'Enter your name' : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email Address",
              prefixIcon: Icon(Icons.alternate_email),
            ),
            validator:
                (val) =>
                    val == null || !val.contains('@')
                        ? 'Enter a valid email'
                        : null,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: !_showPassword,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() => _showPassword = !_showPassword),
              ),
            ),
            validator:
                (val) =>
                    val != null && val.length >= 6
                        ? null
                        : 'Minimum 6 characters',
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_showConfirmPassword,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _showConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed:
                    () => setState(
                      () => _showConfirmPassword = !_showConfirmPassword,
                    ),
              ),
            ),
            validator:
                (val) =>
                    val == _passwordController.text
                        ? null
                        : 'Passwords do not match',
          ),
          const SizedBox(height: 20),
          UserTypeSelector(
            selectedRole: _selectedRole,
            onChanged: (val) => setState(() => _selectedRole = val),
          ),
          const SizedBox(height: 30),
          Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authStateNotifierProvider);

              return authState.map(
                loading: (_) => const CircularLoader(),
                authenticated: (_) => const SizedBox(),
                unauthenticated:
                    (_) => PrimaryButton(
                      text: "Sign Up",
                      onPressed: _onSignupPressed,
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
                          text: "Sign Up",
                          onPressed: _onSignupPressed,
                        ),
                      ],
                    ),
                (_) =>
                    PrimaryButton(text: "Sign Up", onPressed: _onSignupPressed),
              );
            },
          ),
        ],
      ),
    );
  }
}
