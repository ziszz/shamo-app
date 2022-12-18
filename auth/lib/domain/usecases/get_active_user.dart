import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetActiveUser {
  final AuthRepository _repository;

  const GetActiveUser(this._repository);

  Future<Either<Failure, User>> execute() => _repository.getActiveUser();
}
