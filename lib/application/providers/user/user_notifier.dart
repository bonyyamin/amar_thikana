import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/application/providers/user/user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState.loading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    const user = User(
      id: '1',
      name: 'Darrell Steward',
      email: 'darrellstrd@gamil.com',
      profileImage: 'https://via.placeholder.com/150',
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
