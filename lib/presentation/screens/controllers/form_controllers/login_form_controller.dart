import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/repository/auth_repository_interface.dart';

class LoginFormController extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef ref;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginFormController(this.ref) : super(const AsyncValue.data(null));

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final repository = ref.read(authRepositoryProvider);

      await repository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  void resetForm() {
    emailController.clear();
    passwordController.clear();
    formKey.currentState?.reset();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final loginFormControllerProvider =
    StateNotifierProvider<LoginFormController, AsyncValue<void>>((ref) {
      return LoginFormController(ref);
    });
