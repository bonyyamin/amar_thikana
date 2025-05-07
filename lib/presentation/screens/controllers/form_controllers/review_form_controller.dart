import 'package:amar_thikana/application/providers/review/review_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/domain/models/review/review.dart';
import 'package:amar_thikana/domain/models/review/rating.dart';
import 'package:amar_thikana/application/providers/user/user_provider.dart';

class ReviewFormController extends StateNotifier<AsyncValue<void>> {
  final StateNotifierProviderRef ref;
  final formKey = GlobalKey<FormState>();
  final commentController = TextEditingController();

  ReviewFormController(this.ref) : super(const AsyncValue.data(null));

  void initializeForm(Review? review) {
    if (review != null) {
      commentController.text = review.comment;

      ref.read(reviewFormProvider.notifier).state = {
        'overall': review.rating.overall,
        'location': review.rating.location,
        'cleanliness': review.rating.cleanliness,
        'accuracy': review.rating.accuracy,
        'value': review.rating.value,
        'communication': review.rating.communication,
      };
    } else {
      // Reset form
      commentController.text = '';
      ref.read(reviewFormProvider.notifier).state = {
        'overall': 0.0,
        'location': 0.0,
        'cleanliness': 0.0,
        'accuracy': 0.0,
        'value': 0.0,
        'communication': 0.0,
      };
    }
  }

  Future<bool> submitReview(String propertyId, {Review? existingReview}) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (!_validateRatings()) {
      state = AsyncValue.error(
        'Please provide all ratings',
        StackTrace.current,
      );
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final userState = ref.read(userProvider);

      final user = userState.maybeWhen(
        loaded: (user) => user,
        orElse: () => throw Exception('User not logged in'),
      );

      final ratingValues = ref.read(reviewFormProvider);

      final rating = Rating(
        overall: ratingValues['overall']!,
        location: ratingValues['location']!,
        cleanliness: ratingValues['cleanliness']!,
        accuracy: ratingValues['accuracy']!,
        value: ratingValues['value']!,
        communication: ratingValues['communication']!,
      );

      if (existingReview != null) {
        // Update existing review
        final updatedReview = existingReview.copyWith(
          comment: commentController.text,
          rating: rating,
          updatedAt: DateTime.now(),
        );

        await ref
            .read(reviewNotifierProvider.notifier)
            .updateReview(updatedReview);
      } else {
        // Create new review
        final newReview = Review(
          id: '', // Will be assigned by the backend
          propertyId: propertyId,
          reviewerId: user.id,
          reviewerName: user.name,
          reviewerAvatar: user.photoUrl ?? '',
          comment: commentController.text,
          rating: rating,
          createdAt: DateTime.now(),
          userId: user.id,
          userName: user.name,
          userImage: user.photoUrl ?? '',
        );

        await ref.read(reviewNotifierProvider.notifier).addReview(newReview);
      }

      state = const AsyncValue.data(null);
      return true;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      return false;
    }
  }

  bool _validateRatings() {
    final ratings = ref.read(reviewFormProvider);
    return !ratings.values.any((rating) => rating == 0.0);
  }

  String? validateComment(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please write a review comment';
    }
    if (value.length < 10) {
      return 'Review should be at least 10 characters long';
    }
    return null;
  }

  void updateRating(String field, double value) {
    final currentForm = ref.read(reviewFormProvider);
    ref.read(reviewFormProvider.notifier).state = {
      ...currentForm,
      field: value,
    };
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}

final reviewFormProvider = StateProvider<Map<String, double>>((ref) {
  return {
    'overall': 0.0,
    'location': 0.0,
    'cleanliness': 0.0,
    'accuracy': 0.0,
    'value': 0.0,
    'communication': 0.0,
  };
});

final reviewFormControllerProvider =
    StateNotifierProvider<ReviewFormController, AsyncValue<void>>((ref) {
      return ReviewFormController(ref);
    });
