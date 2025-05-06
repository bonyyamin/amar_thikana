import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/application/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState.loading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final user = User(
      id: '1',
      name: 'Darrell Steward',
      email: 'darrellstrd@gamil.com',
      userType: UserType.renter, // Provide a valid UserType
      isVerified: false, // Provide a boolean value
      createdAt: DateTime.now(), // Provide current timestamp
    );
    state = UserState.loaded(user);
  }

  void updateUser(User updatedUser) {
    state = UserState.loaded(updatedUser);
  }

  void logout() {
    // Here you could clear secure storage etc
    state = const UserState.loading();
  }
}
