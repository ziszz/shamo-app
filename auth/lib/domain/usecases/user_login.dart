import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class UserLogin {
  final AuthRepository _repository;

  const UserLogin(this._repository);

  Future<Either<Failure, User>> execute(String email, String password) =>
      _repository.login(email, password);
}
