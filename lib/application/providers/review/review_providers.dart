import 'package:amar_thikana/application/providers/api_client_provider.dart';
import 'package:amar_thikana/application/providers/network_info_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/datasources/remote/review_remote_datasource.dart';
import '../../../data/repositories/review_repository.dart';
import '../../../domain/models/review/review.dart';
import '../../../domain/repository/review_repository_interface.dart';
import '../../use_cases/review/get_property_reviews_use_case.dart';
import '../../use_cases/review/get_property_review_stats_use_case.dart';
import '../../use_cases/review/add_review_use_case.dart';
import '../../use_cases/review/update_review_use_case.dart';
import '../../use_cases/review/delete_review_use_case.dart';
import '../../use_cases/review/get_user_reviews_use_case.dart';

// Repository and datasource providers
final reviewRemoteDataSourceProvider = Provider<ReviewRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final firestore = FirebaseFirestore.instance;
  return ReviewRemoteDataSourceImpl(
    apiClient: apiClient,
    firestore: firestore,
  );
});

final reviewRepositoryProvider = Provider<ReviewRepositoryInterface>((ref) {
  return ReviewRepository(
    remoteDataSource: ref.watch(reviewRemoteDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

// Use case providers
final getPropertyReviewsUseCaseProvider = Provider<GetPropertyReviewsUseCase>((ref) {
  return GetPropertyReviewsUseCase(ref.watch(reviewRepositoryProvider));
});

final getPropertyReviewStatsUseCaseProvider = Provider<GetPropertyReviewStatsUseCase>((ref) {
  return GetPropertyReviewStatsUseCase(ref.watch(reviewRepositoryProvider));
});

final addReviewUseCaseProvider = Provider<AddReviewUseCase>((ref) {
  return AddReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final updateReviewUseCaseProvider = Provider<UpdateReviewUseCase>((ref) {
  return UpdateReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final deleteReviewUseCaseProvider = Provider<DeleteReviewUseCase>((ref) {
  return DeleteReviewUseCase(ref.watch(reviewRepositoryProvider));
});

final getUserReviewsUseCaseProvider = Provider<GetUserReviewsUseCase>((ref) {
  return GetUserReviewsUseCase(ref.watch(reviewRepositoryProvider));
});

// State providers

// Property reviews state
final propertyReviewsProvider = FutureProvider.family<List<Review>, String>((ref, propertyId) async {
  final useCase = ref.watch(getPropertyReviewsUseCaseProvider);
  final result = await useCase.execute(propertyId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (reviews) => reviews,
  );
});

// Property review stats state
final propertyReviewStatsProvider = FutureProvider.family<Map<String, double>, String>((ref, propertyId) async {
  final useCase = ref.watch(getPropertyReviewStatsUseCaseProvider);
  final result = await useCase.execute(propertyId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (stats) => stats,
  );
});

// User reviews state
final userReviewsProvider = FutureProvider.family<List<Review>, String>((ref, userId) async {
  final useCase = ref.watch(getUserReviewsUseCaseProvider);
  final result = await useCase.execute(userId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (reviews) => reviews,
  );
});

// Add review
final addReviewProvider = FutureProvider.family<Review, Review>((ref, review) async {
  final useCase = ref.watch(addReviewUseCaseProvider);
  final result = await useCase.execute(review);
  
  // Invalidate providers to refresh data
  ref.invalidate(propertyReviewsProvider(review.propertyId));
  ref.invalidate(propertyReviewStatsProvider(review.propertyId));
  ref.invalidate(userReviewsProvider(review.reviewerId));
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (newReview) => newReview,
  );
});

// Update review
final updateReviewProvider = FutureProvider.family<Review, Review>((ref, review) async {
  final useCase = ref.watch(updateReviewUseCaseProvider);
  final result = await useCase.execute(review);
  
  // Invalidate providers to refresh data
  ref.invalidate(propertyReviewsProvider(review.propertyId));
  ref.invalidate(propertyReviewStatsProvider(review.propertyId));
  ref.invalidate(userReviewsProvider(review.reviewerId));
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (updatedReview) => updatedReview,
  );
});

// Delete review
final deleteReviewProvider = FutureProvider.family<bool, Map<String, String>>((ref, params) async {
  final reviewId = params['reviewId']!;
  final propertyId = params['propertyId']!;
  final userId = params['userId']!;
  
  final useCase = ref.watch(deleteReviewUseCaseProvider);
  final result = await useCase.execute(reviewId);
  
  // Invalidate providers to refresh data
  ref.invalidate(propertyReviewsProvider(propertyId));
  ref.invalidate(propertyReviewStatsProvider(propertyId));
  ref.invalidate(userReviewsProvider(userId));
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (success) => success,
  );
});