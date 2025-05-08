import 'package:amar_thikana/core/errors/failure.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:dartz/dartz.dart';


/// Abstract definition for the User Repository
abstract class UserRepositoryInterface {
  /// Get the user profile from data source
  /// Returns [User] model on success or [Failure] on error
  Future<Either<Failure, User>> getUserProfile();
  
  /// Update the user profile
  /// [user] - The updated user data
  /// Returns [User] model on success or [Failure] on error
  Future<Either<Failure, User>> updateUserProfile(User user);
  
  /// Clears cached user data
  Future<void> clearUserCache();
}