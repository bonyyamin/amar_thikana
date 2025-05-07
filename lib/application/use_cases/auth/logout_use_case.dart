import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/repository/auth_repository_interface.dart';
import '../../providers/auth/auth_providers.dart';

class LogoutUseCase {
  final IAuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<bool> call() async {
    return await _authRepository.logout();
  }
}

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(authRepository);
});