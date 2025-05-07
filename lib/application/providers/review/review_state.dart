import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/review/review.dart';

part 'review_state.freezed.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default([]) List<Review> reviews,
    @Default({}) Map<String, double> stats,
    @Default(null) Review? currentReview,
    @Default(false) bool isSubmitting,
    @Default(false) bool isDeleting,
    @Default(null) String? successMessage,
  }) = _ReviewState;
}