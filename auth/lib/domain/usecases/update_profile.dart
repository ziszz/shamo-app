import 'package:dartz/dartz.dart';
import '../../../auth/lib/domain/entities/user.dart';
import '../../../auth/lib/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UpdateProfile {
  final AuthRepository _repository;

  const UpdateProfile(this._repository);

  Future<Either<Failure, User>> execute(
          String token, String name, String email, String username) =>
      _repository.updateProfile(token, name, email, username);
}
