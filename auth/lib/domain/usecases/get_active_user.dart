import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/entities/user.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class GetActiveUser {
  final AuthRepository _repository;

  const GetActiveUser(this._repository);

  Future<Either<Failure, User>> execute() => _repository.getActiveUser();
}
