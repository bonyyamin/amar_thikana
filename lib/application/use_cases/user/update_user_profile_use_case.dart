import 'package:amar_thikana/application/use_cases/user/use_case.dart';
import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/domain/repository/user_repository_interface.dart';
import 'package:dartz/dartz.dart';
// import '../../core/failures.dart';
// import '../../core/use_case.dart';
// import '../models/user.dart';
// import '../repositories/user_repository_interface.dart';

/// Use case for updating a user's profile
class UpdateUserProfileUseCase implements UseCase<User, UpdateUserProfileParams> {
  final UserRepositoryInterface repository;

  UpdateUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateUserProfileParams params) async {
    return await repository.updateUserProfile(params.user);
  }
}

/// Parameters for the update user profile use case
class UpdateUserProfileParams {
  final User user;

  UpdateUserProfileParams({required this.user});
}