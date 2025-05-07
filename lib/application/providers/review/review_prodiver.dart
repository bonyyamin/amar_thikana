// lib/application/providers/review/review_provider.dart
import 'package:amar_thikana/application/providers/review/review_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'review_notifier.dart';
import 'review_state.dart';

// Review state notifier provider
final reviewNotifierProvider = StateNotifierProvider<ReviewNotifier, ReviewState>((ref) {
  return ReviewNotifier(
    getPropertyReviewsUseCase: ref.watch(getPropertyReviewsUseCaseProvider),
    getPropertyReviewStatsUseCase: ref.watch(getPropertyReviewStatsUseCaseProvider),
    addReviewUseCase: ref.watch(addReviewUseCaseProvider),
    updateReviewUseCase: ref.watch(updateReviewUseCaseProvider),
    deleteReviewUseCase: ref.watch(deleteReviewUseCaseProvider),
    getUserReviewsUseCase: ref.watch(getUserReviewsUseCaseProvider),
  );
});

// Review form provider (for creating/editing reviews)
final reviewFormProvider = StateProvider.autoDispose<Map<String, dynamic>>((ref) {
  return {
    'overall': 0.0,
    'location': 0.0,
    'cleanliness': 0.0,
    'accuracy': 0.0,
    'value': 0.0,
    'communication': 0.0,
    'comment': '',
  };
});

// Selected property for reviews
final selectedPropertyForReviewProvider = StateProvider<String?>((ref) => null);

// Can user review provider (checks if user has already reviewed a property)
final canUserReviewProvider = FutureProvider.family<bool, Map<String, String>>((ref, params) async {
  final propertyId = params['propertyId']!;
  final userId = params['userId']!;
  
  // Get all reviews for the property
  final reviews = await ref.watch(propertyReviewsProvider(propertyId).future);
  
  // Check if this user has already reviewed this property
  return !reviews.any((review) => review.reviewerId == userId);
});