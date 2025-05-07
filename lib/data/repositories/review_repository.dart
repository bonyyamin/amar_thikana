// lib/data/repositories/review_repository.dart
import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../core/errors/app_exceptions.dart';
import '../../core/network/network_info.dart';
import '../../domain/models/review/review.dart';
import '../../domain/repository/review_repository_interface.dart';
import '../datasources/remote/review_remote_datasource.dart';
import '../dtos/review_dto.dart';

class ReviewRepository implements ReviewRepositoryInterface {
  final ReviewRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ReviewRepository({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Review>>> getPropertyReviews(
    String propertyId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final reviewDtos = await remoteDataSource.getPropertyReviews(
          propertyId,
        );
        final reviews = reviewDtos.map((dto) => dto.toDomain()).toList();
        return Right(reviews);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Map<String, double>>> getPropertyReviewStats(
    String propertyId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final stats = await remoteDataSource.getPropertyReviewStats(propertyId);
        return Right(stats);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Review>> addReview(Review review) async {
    if (await networkInfo.isConnected) {
      try {
        final reviewDto = ReviewDto.fromDomain(review);
        final resultDto = await remoteDataSource.addReview(reviewDto);
        return Right(resultDto.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Review>> updateReview(Review review) async {
    if (await networkInfo.isConnected) {
      try {
        final reviewDto = ReviewDto.fromDomain(review);
        final resultDto = await remoteDataSource.updateReview(reviewDto);
        return Right(resultDto.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteReview(String reviewId) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.deleteReview(reviewId);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getUserReviews(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final reviewDtos = await remoteDataSource.getUserReviews(userId);
        final reviews = reviewDtos.map((dto) => dto.toDomain()).toList();
        return Right(reviews);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }
}
