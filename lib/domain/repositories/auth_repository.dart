import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/utilities/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getUser(String token);
  Future<Either<Failure, User>> register(
      String name, String email, String username, String password);
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, User>> updateProfile(
      String token, String name, String email, String username);
  Future<Either<Failure, bool>> logout(String token);
  Future<bool> saveUser(String token);
  Future<bool> removeUser();
}
