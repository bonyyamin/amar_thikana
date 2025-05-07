// lib/application/providers/review/review_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/models/review/review.dart';
import '../../use_cases/review/get_property_reviews_use_case.dart';
import '../../use_cases/review/get_property_review_stats_use_case.dart';
import '../../use_cases/review/add_review_use_case.dart';
import '../../use_cases/review/update_review_use_case.dart';
import '../../use_cases/review/delete_review_use_case.dart';
import '../../use_cases/review/get_user_reviews_use_case.dart';
import 'review_state.dart';

class ReviewNotifier extends StateNotifier<ReviewState> {
  final GetPropertyReviewsUseCase _getPropertyReviewsUseCase;
  final GetPropertyReviewStatsUseCase _getPropertyReviewStatsUseCase;
  final AddReviewUseCase _addReviewUseCase;
  final UpdateReviewUseCase _updateReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;
  final GetUserReviewsUseCase _getUserReviewsUseCase;

  ReviewNotifier({
    required GetPropertyReviewsUseCase getPropertyReviewsUseCase,
    required GetPropertyReviewStatsUseCase getPropertyReviewStatsUseCase,
    required AddReviewUseCase addReviewUseCase,
    required UpdateReviewUseCase updateReviewUseCase,
    required DeleteReviewUseCase deleteReviewUseCase,
    required GetUserReviewsUseCase getUserReviewsUseCase,
  })  : _getPropertyReviewsUseCase = getPropertyReviewsUseCase,
        _getPropertyReviewStatsUseCase = getPropertyReviewStatsUseCase,
        _addReviewUseCase = addReviewUseCase,
        _updateReviewUseCase = updateReviewUseCase,
        _deleteReviewUseCase = deleteReviewUseCase,
        _getUserReviewsUseCase = getUserReviewsUseCase,
        super(const ReviewState());

  Future<void> getPropertyReviews(String propertyId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    final result = await _getPropertyReviewsUseCase.execute(propertyId);
    
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (reviews) => state = state.copyWith(
        isLoading: false,
        reviews: reviews,
      ),
    );
  }

  Future<void> getPropertyReviewStats(String propertyId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    final result = await _getPropertyReviewStatsUseCase.execute(propertyId);
    
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (stats) => state = state.copyWith(
        isLoading: false,
        stats: stats,
      ),
    );
  }

  Future<void> addReview(Review review) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null, successMessage: null);
    
    final result = await _addReviewUseCase.execute(review);
    
    result.fold(
      (failure) => state = state.copyWith(
        isSubmitting: false,
        errorMessage: failure.message,
      ),
      (newReview) {
        final updatedReviews = [newReview, ...state.reviews];
        state = state.copyWith(
          isSubmitting: false,
          reviews: updatedReviews,
          currentReview: newReview,
          successMessage: 'Review added successfully',
        );
        // Refresh the stats
        getPropertyReviewStats(review.propertyId);
      },
    );
  }

  Future<void> updateReview(Review review) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null, successMessage: null);
    
    final result = await _updateReviewUseCase.execute(review);
    
    result.fold(
      (failure) => state = state.copyWith(
        isSubmitting: false,
        errorMessage: failure.message,
      ),
      (updatedReview) {
        final updatedReviews = state.reviews.map((r) => 
          r.id == updatedReview.id ? updatedReview : r
        ).toList();
        
        state = state.copyWith(
          isSubmitting: false,
          reviews: updatedReviews,
          currentReview: updatedReview,
          successMessage: 'Review updated successfully',
        );
        // Refresh the stats
        getPropertyReviewStats(review.propertyId);
      },
    );
  }

  Future<void> deleteReview(String reviewId, String propertyId) async {
    state = state.copyWith(isDeleting: true, errorMessage: null, successMessage: null);
    
    final result = await _deleteReviewUseCase.execute(reviewId);
    
    result.fold(
      (failure) => state = state.copyWith(
        isDeleting: false,
        errorMessage: failure.message,
      ),
      (success) {
        final updatedReviews = state.reviews.where((r) => r.id != reviewId).toList();
        
        state = state.copyWith(
          isDeleting: false,
          reviews: updatedReviews,
          currentReview: null,
          successMessage: 'Review deleted successfully',
        );
        // Refresh the stats
        getPropertyReviewStats(propertyId);
      },
    );
  }

  Future<void> getUserReviews(String userId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    final result = await _getUserReviewsUseCase.execute(userId);
    
    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (reviews) => state = state.copyWith(
        isLoading: false,
        reviews: reviews,
      ),
    );
  }

  void setCurrentReview(Review? review) {
    state = state.copyWith(currentReview: review);
  }

  void clearMessages() {
    state = state.copyWith(errorMessage: null, successMessage: null);
  }
}