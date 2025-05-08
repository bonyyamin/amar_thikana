import 'package:amar_thikana/application/use_cases/user/use_case.dart';
import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/domain/repository/user_repository_interface.dart';
import 'package:dartz/dartz.dart';
// import '../../core/failures.dart';
// import '../../core/use_case.dart';

// import '../repositories/user_repository_interface.dart';

/// Use case for getting a user's profile
class GetUserProfileUseCase implements UseCase<User, NoParams> {
  final UserRepositoryInterface repository;

  GetUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getUserProfile();
  }
}