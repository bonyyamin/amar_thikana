import 'package:amar_thikana/application/providers/auth/auth_providers.dart';
import 'package:amar_thikana/application/providers/review/review_prodiver.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/models/review/review.dart';
import '../../../../domain/models/review/rating.dart';

class ReviewFormController extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  final formKey = GlobalKey<FormState>();

  ReviewFormController(this.ref) : super(const AsyncValue.data(null));

  // Form controls
  final commentController = TextEditingController();

  // Initialize with existing review if editing
  void initWithReview(Review? review) {
    if (review != null) {
      commentController.text = review.comment;
      ref.read(reviewFormProvider.notifier).state = {
        'overall': review.rating.overall,
        'location': review.rating.location,
        'cleanliness': review.rating.cleanliness,
        'accuracy': review.rating.accuracy,
        'value': review.rating.value,
        'communication': review.rating.communication,
        'comment': review.comment,
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
        'comment': '',
      };
    }
  }

  // Update rating values
  void updateRating(String field, double value) {
    final currentForm = ref.read(reviewFormProvider);
    ref.read(reviewFormProvider.notifier).state = {
      ...currentForm,
      field: value,
    };
  }

  // Submit review
  Future<bool> submitReview(String propertyId, {Review? existingReview}) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    state = const AsyncValue.loading();

    try {
      final firebaseUser = ref.read(currentUserProvider);
      if (firebaseUser == null) {
        state = AsyncValue.error('User not authenticated', StackTrace.current);
        return false;
      }

      // Create an AppUser from Firebase User
      final user = AppUser(
        id: firebaseUser.uid,
        firstName: firebaseUser.displayName?.split(' ').first ?? 'Anonymous',
        lastName: firebaseUser.displayName?.split(' ').last ?? 'User',
        profilePicture: firebaseUser.photoURL,
        email: firebaseUser.email ?? '',
        createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
      );

      final formData = ref.read(reviewFormProvider);

      final rating = Rating(
        overall: formData['overall'],
        location: formData['location'],
        cleanliness: formData['cleanliness'],
        accuracy: formData['accuracy'],
        value: formData['value'],
        communication: formData['communication'],
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
          reviewerName: '${user.firstName} ${user.lastName}',
          reviewerAvatar: user.profilePicture ?? '',
          comment: commentController.text,
          rating: rating,
          createdAt: DateTime.now(), userId: '', userName: '', userImage: '',
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

  // Clear form
  void clearForm() {
    commentController.text = '';
    ref.read(reviewFormProvider.notifier).state = {
      'overall': 0.0,
      'location': 0.0,
      'cleanliness': 0.0,
      'accuracy': 0.0,
      'value': 0.0,
      'communication': 0.0,
      'comment': '',
    };
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}

// Provider for the review form controller
final reviewFormControllerProvider =
    StateNotifierProvider.autoDispose<ReviewFormController, AsyncValue<void>>((
      ref,
    ) {
      return ReviewFormController(ref);
    });
