import 'package:amar_thikana/core/network/network_info.dart';
import 'package:amar_thikana/data/datasources/local/user_local_datasource.dart';
import 'package:amar_thikana/data/datasources/remote/user_remote_datasource.dart';
import 'package:amar_thikana/domain/models/user/user.dart';
import 'package:amar_thikana/domain/repository/user_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:amar_thikana/core/errors/failure.dart';

class UserRepository implements UserRepositoryInterface {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> getUserProfile() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final userDto = await remoteDataSource.getUserProfile();
          await localDataSource.cacheUserProfile(userDto);
          return Right(userDto.toModel());
        } catch (e) {
          return await _getFromLocalCache();
        }
      } else {
        return await _getFromLocalCache();
      }
    } catch (e) {
      return Left(Failure.fromException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserProfile(User user) async {
    try {
      if (await networkInfo.isConnected) {
        final userDto = await remoteDataSource.updateUserProfile(user);
        await localDataSource.cacheUserProfile(userDto);
        return Right(userDto.toModel());
      } else {
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(Failure.fromException(e as Exception));
    }
  }

  @override
  Future<void> clearUserCache() async {
    await localDataSource.clearUserCache();
  }

  Future<Either<Failure, User>> _getFromLocalCache() async {
    try {
      final localUser = await localDataSource.getLastUserProfile();
      return Right(localUser.toModel());
    } catch (e) {
      return Left(CacheFailure('No cached user data found'));
    }
  }
}
