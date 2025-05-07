import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/models/review/review.dart';
import '../../../domain/repository/review_repository_interface.dart';

class GetPropertyReviewsUseCase {
  final ReviewRepositoryInterface repository;

  GetPropertyReviewsUseCase(this.repository);

  Future<Either<Failure, List<Review>>> execute(String propertyId) {
    return repository.getPropertyReviews(propertyId);
  }
}