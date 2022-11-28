import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';

import '../../utilities/failure.dart';

class GetUser {
  final AuthRepository repository;

  const GetUser({required this.repository});

  Future<Either<Failure, User>> execute(String token) =>
      repository.getUser(token);
}
