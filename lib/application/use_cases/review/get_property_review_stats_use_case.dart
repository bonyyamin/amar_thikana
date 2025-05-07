import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/repository/review_repository_interface.dart';

class GetPropertyReviewStatsUseCase {
  final ReviewRepositoryInterface repository;

  GetPropertyReviewStatsUseCase(this.repository);

  Future<Either<Failure, Map<String, double>>> execute(String propertyId) {
    return repository.getPropertyReviewStats(propertyId);
  }
}