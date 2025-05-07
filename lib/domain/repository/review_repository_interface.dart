import 'package:amar_thikana/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../models/review/review.dart';

abstract class ReviewRepositoryInterface {
  /// Get all reviews for a specific property
  Future<Either<Failure, List<Review>>> getPropertyReviews(String propertyId);
  
  /// Get review statistics for a property (average ratings in each category)
  Future<Either<Failure, Map<String, double>>> getPropertyReviewStats(String propertyId);
  
  /// Add a new review for a property
  Future<Either<Failure, Review>> addReview(Review review);
  
  /// Update an existing review
  Future<Either<Failure, Review>> updateReview(Review review);
  
  /// Delete a review
  Future<Either<Failure, bool>> deleteReview(String reviewId);
  
  /// Get reviews written by a specific user
  Future<Either<Failure, List<Review>>> getUserReviews(String userId);
}