import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/repository/auth_repository_interface.dart';
import '../../providers/auth/auth_providers.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<User> call({required String email, required String password}) async {
    return await _authRepository.login(email: email, password: password);
  }
}

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginUseCase(authRepository);
});