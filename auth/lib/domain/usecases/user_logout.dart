import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserLogout {
  final AuthRepository _repository;

  const UserLogout(this._repository);

  Future<Either<Failure, bool>> execute(String token) =>
      _repository.logout(token);
}
