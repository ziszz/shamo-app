import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final AuthRepository _repository;

  const GetUser(this._repository);

  Future<Either<Failure, User>> execute(String token) =>
      _repository.getUser(token);
}
