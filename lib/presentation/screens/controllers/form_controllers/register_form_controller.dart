import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserType { renter, landlord }

class RegisterFormController extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef ref;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  UserType _selectedUserType = UserType.renter;
  UserType get selectedUserType => _selectedUserType;

  RegisterFormController(this.ref) : super(const AsyncValue.data(null));

  void setUserType(UserType type) {
    _selectedUserType = type;
  }

  Future<bool> register() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final repository = ref.read(authRepositoryProvider);

      await repository.register(
        email: emailController.text.trim(),
        password: passwordController.text,
        name: nameController.text.trim(),
        userType: _selectedUserType.name,
        phone: phoneController.text.trim(),
      );

      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  void resetForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    _selectedUserType = UserType.renter;
    formKey.currentState?.reset();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
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

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    // Basic Bangladesh phone number validation
    if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(value)) {
      return 'Please enter a valid Bangladesh phone number';
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

final registerFormControllerProvider =
    StateNotifierProvider<RegisterFormController, AsyncValue<void>>((ref) {
      return RegisterFormController(ref);
    });
