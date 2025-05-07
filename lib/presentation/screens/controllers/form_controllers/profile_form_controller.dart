import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/application/providers/user/user_provider.dart';

class ProfileFormController extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef ref;
  final formKey = GlobalKey<FormState>();

  // Common fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();

  // Renter specific fields
  final occupationController = TextEditingController();
  final universityController = TextEditingController();
  final employerController = TextEditingController();
  final budgetMinController = TextEditingController();
  final budgetMaxController = TextEditingController();
  DateTime? moveInDate;
  bool isStudent = false;
  List<String> preferredAreas = [];
  String? preferredPropertyType;

  // Landlord specific fields
  final businessNameController = TextEditingController();
  final businessRegNoController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isBusinessAccount = false;

  ProfileFormController(this.ref) : super(const AsyncValue.data(null));

  void initializeForm(User user) {
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phoneNumber ?? '';

    if (user.renterDetails != null) {
      occupationController.text = user.renterDetails?.occupation ?? '';
      universityController.text = user.renterDetails?.universityName ?? '';
      employerController.text = user.renterDetails?.employerName ?? '';
      budgetMinController.text =
          user.renterDetails?.budgetMin?.toString() ?? '';
      budgetMaxController.text =
          user.renterDetails?.budgetMax?.toString() ?? '';
      moveInDate = user.renterDetails?.moveInDate;
      isStudent = user.renterDetails?.isStudent ?? false;
      preferredAreas = user.renterDetails?.preferredAreas ?? [];
      preferredPropertyType = user.renterDetails?.preferredPropertyType;
      bioController.text = user.renterDetails?.bio ?? '';
    } else if (user.landlordDetails != null) {
      businessNameController.text = user.landlordDetails?.businessName ?? '';
      businessRegNoController.text =
          user.landlordDetails?.businessRegistrationNumber ?? '';
      descriptionController.text = user.landlordDetails?.description ?? '';
      isBusinessAccount = user.landlordDetails?.isBusinessAccount ?? false;
      bioController.text = user.landlordDetails?.description ?? '';
    }
  }

  Future<bool> updateProfile(User currentUser) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final updatedUser = currentUser.copyWith(
        name: nameController.text.trim(),
        phoneNumber: phoneController.text.trim(),
      );

      if (currentUser.renterDetails != null) {
        final updatedRenterDetails = currentUser.renterDetails!.copyWith(
          occupation: occupationController.text.trim(),
          isStudent: isStudent,
          universityName: universityController.text.trim(),
          employerName: employerController.text.trim(),
          preferredAreas: preferredAreas,
          budgetMin: double.tryParse(budgetMinController.text),
          budgetMax: double.tryParse(budgetMaxController.text),
          preferredPropertyType: preferredPropertyType,
          moveInDate: moveInDate,
          bio: bioController.text.trim(),
        );
        ref
            .read(userProvider.notifier)
            .updateUser(
              updatedUser.copyWith(renterDetails: updatedRenterDetails),
            );
      } else if (currentUser.landlordDetails != null) {
        final updatedLandlordDetails = currentUser.landlordDetails!.copyWith(
          isBusinessAccount: isBusinessAccount,
          businessName: businessNameController.text.trim(),
          businessRegistrationNumber: businessRegNoController.text.trim(),
          description: descriptionController.text.trim(),
        );
        ref
            .read(userProvider.notifier)
            .updateUser(
              updatedUser.copyWith(landlordDetails: updatedLandlordDetails),
            );
      }

      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Phone is optional
    }
    if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(value)) {
      return 'Please enter a valid Bangladesh phone number';
    }
    return null;
  }

  String? validateBudget(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Budget is optional
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid amount';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bioController.dispose();
    occupationController.dispose();
    universityController.dispose();
    employerController.dispose();
    budgetMinController.dispose();
    budgetMaxController.dispose();
    businessNameController.dispose();
    businessRegNoController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

final profileFormControllerProvider =
    StateNotifierProvider<ProfileFormController, AsyncValue<void>>((ref) {
      return ProfileFormController(ref);
    });
