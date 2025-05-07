import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../domain/models/review/review.dart';
import '../../../domain/repository/review_repository_interface.dart';

class AddReviewUseCase {
  final ReviewRepositoryInterface repository;

  AddReviewUseCase(this.repository);

  Future<Either<Failure, Review>> execute(Review review) {
    return repository.addReview(review);
  }
}