import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class UserRegister {
  final AuthRepository _repository;

  const UserRegister(this._repository);

  Future<Either<Failure, User>> execute(
          String name, String email, String username, String password) =>
      _repository.register(name, email, username, password);
}
