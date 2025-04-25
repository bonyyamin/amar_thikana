import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/common_widgets/loaders/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_type_selector.dart';
import '../../../../../application/providers/auth/auth_providers.dart';

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
      final notifier = ref.read(authNotifierProvider.notifier);
      final result = await notifier.register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        role: _selectedRole,
      );

      if (!result.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.message), backgroundColor: Colors.red),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

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
          authState.isLoading
              ? const CircularLoader()
              : PrimaryButton(text: "Sign Up", onPressed: _onSignupPressed),
        ],
      ),
    );
  }
}
