import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class UserLogout {
  final AuthRepository _repository;

  const UserLogout(this._repository);

  Future<Either<Failure, bool>> execute(String token) =>
      _repository.logout(token);
}
