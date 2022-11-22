import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/utilities/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getUser(String token);
  Future<Either<Failure, User>> register(
      String name, String email, String username, String password);
}
