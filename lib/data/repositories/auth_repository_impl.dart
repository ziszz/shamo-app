import 'package:dartz/dartz.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../utilities/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUser(String token) async {
    try {
      final result = await remoteDataSource.getUser(token);
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
          await remoteDataSource.register(name, email, username, password);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }
}
