import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class UpdateProfile {
  final AuthRepository _repository;

  const UpdateProfile(this._repository);

  Future<Either<Failure, User>> execute(
          String token, String name, String email, String username) =>
      _repository.updateProfile(token, name, email, username);
}
