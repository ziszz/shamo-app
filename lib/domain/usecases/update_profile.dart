import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/user.dart';
import 'package:shamo_app/domain/repositories/auth_repository.dart';
import 'package:shamo_app/utilities/failure.dart';

class UpdateProfile {
  final AuthRepository repository;

  const UpdateProfile({required this.repository});

  Future<Either<Failure, User>> execute(
          String token, String name, String email, String username) =>
      repository.updateProfile(token, name, email, username);
}
