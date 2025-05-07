import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/repository/auth_repository_interface.dart';
import '../../providers/auth/auth_providers.dart';

class RegisterUseCase {
  final IAuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<User> call({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    return await _authRepository.register(
      email: email,
      password: password,
      name: name,
      userType: userType, phone: '',
    );
  }
}

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(authRepository);
});