import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/models/review/review.dart';
import '../../../domain/repository/review_repository_interface.dart';

class GetUserReviewsUseCase {
  final ReviewRepositoryInterface repository;

  GetUserReviewsUseCase(this.repository);

  Future<Either<Failure, List<Review>>> execute(String userId) {
    return repository.getUserReviews(userId);
  }
}