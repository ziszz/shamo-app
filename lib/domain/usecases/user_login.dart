import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserLogin {
  final AuthRepository repository;

  const UserLogin({required this.repository});

  Future<Either<Failure, User>> execute(String email, String password) =>
      repository.login(email, password);
}
