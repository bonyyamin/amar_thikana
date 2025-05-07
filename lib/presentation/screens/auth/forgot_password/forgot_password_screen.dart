import 'package:amar_thikana/presentation/common_widgets/buttons/primary_button.dart';
import 'package:amar_thikana/presentation/common_widgets/loaders/circular_loader.dart';
import 'package:amar_thikana/presentation/screens/navigation/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/auth/auth_providers.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
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
      try {
        final notifier = ref.read(authStateNotifierProvider.notifier);
        await notifier.forgotPassword(_emailController.text.trim());

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password reset email sent. Please check your inbox.',
              ),
              backgroundColor: Colors.green,
            ),
          );
          context.go(RouteNames.login);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Text(
                'Enter your email address and we\'ll send you a password reset link.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                validator:
                    (value) =>
                        value == null ||
                                !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)
                            ? 'Enter valid email'
                            : null,
              ),
              const SizedBox(height: 30),
              Consumer(
                builder: (context, ref, child) {
                  final authState = ref.watch(authStateNotifierProvider);

                  return authState.map(
                    loading: (_) => const CircularLoader(),
                    authenticated: (_) => const SizedBox(),
                    unauthenticated:
                        (_) => Column(
                          children: [
                            PrimaryButton(
                              text: 'Send Reset Link',
                              onPressed: _sendResetLink,
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () => context.go(RouteNames.login),
                              child: const Text('Back to Login'),
                            ),
                          ],
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
                              text: 'Send Reset Link',
                              onPressed: _sendResetLink,
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () => context.go(RouteNames.login),
                              child: const Text('Back to Login'),
                            ),
                          ],
                        ),
                    (_) => Column(
                      children: [
                        PrimaryButton(
                          text: 'Send Reset Link',
                          onPressed: _sendResetLink,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () => context.go(RouteNames.login),
                          child: const Text('Back to Login'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
