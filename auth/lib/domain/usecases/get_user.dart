import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/entities/user.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';

import '../../utilities/failure.dart';

class GetUser {
  final AuthRepository _repository;

  const GetUser(this._repository);

  Future<Either<Failure, User>> execute(String token) =>
      _repository.getUser(token);
}
