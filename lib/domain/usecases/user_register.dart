import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UserRegister {
  final AuthRepository repository;

  const UserRegister({required this.repository});

  Future<Either<Failure, User>> execute(
          String name, String email, String username, String password) =>
      repository.register(name, email, username, password);
}
