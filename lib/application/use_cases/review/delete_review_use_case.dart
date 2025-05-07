import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/repository/review_repository_interface.dart';

class DeleteReviewUseCase {
  final ReviewRepositoryInterface repository;

  DeleteReviewUseCase(this.repository);

  Future<Either<Failure, bool>> execute(String reviewId) {
    return repository.deleteReview(reviewId);
  }
}