import 'package:dartz/dartz.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/data/datasources/remote/auth_remote_data_source.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../utilities/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, User>> getUser(String token) async {
    try {
      final result = await _remoteDataSource.getUser(token);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String name, String email, String username, String password) async {
    try {
      final result =
          await _remoteDataSource.register(name, email, username, password);
      _localDataSource.cacheToken(result.token);

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final result = await _remoteDataSource.login(email, password);
      _localDataSource.cacheToken(result.token);

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile(
      String token, String name, String email, String username) async {
    try {
      final result =
          await _remoteDataSource.updateProfile(token, name, email, username);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, bool>> logout(String token) async {
    try {
      final result = await _remoteDataSource.logout(token);
      _localDataSource.clearTokenCache();

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(Constants.unauthenticatedMessage));
    }
  }

  @override
  Future<String> getCacheToken() async {
    return await _localDataSource.getCacheToken();
  }
}
