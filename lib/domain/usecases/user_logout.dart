import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserLogout {
  final AuthRepository repository;

  const UserLogout({required this.repository});

  Future<Either<Failure, bool>> execute(String token) =>
      repository.logout(token);
}
