import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/entities/user.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserLogin {
  final AuthRepository _repository;

  const UserLogin(this._repository);

  Future<Either<Failure, User>> execute(String email, String password) =>
      _repository.login(email, password);
}
