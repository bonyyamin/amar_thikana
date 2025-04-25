import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetLink() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // --- Simulate Network Request ---
      await Future.delayed(const Duration(seconds: 2));
      // --- TODO: Implement actual Forgot Password Logic (e.g., Firebase sendPasswordResetEmail) ---
      // If successful:
      // Show success message, maybe navigate back to login
      // If error:
      // Show error message

      print('Sending reset link to: ${_emailController.text}');
      setState(() => _isLoading = false);

      // Example success feedback
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent (if account exists)'),
          backgroundColor: Colors.green,
        ),
      );
      // Optionally navigate back after a short delay
      // await Future.delayed(const Duration(seconds: 1));
      // if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.login),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Reset Your Password",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                "Enter the email address associated with your account and we'll send you a link to reset your password.",
                style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // --- Email Field ---
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // --- Send Reset Link Button ---
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : PrimaryButton(
                    text: "Send Reset Link",
                    onPressed: _sendResetLink,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
