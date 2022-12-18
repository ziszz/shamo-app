import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/entities/user.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserRegister {
  final AuthRepository _repository;

  const UserRegister(this._repository);

  Future<Either<Failure, User>> execute(
          String name, String email, String username, String password) =>
      _repository.register(name, email, username, password);
}
