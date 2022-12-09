import 'package:shamo_app/domain/repositories/auth_repository.dart';

class SaveActiveUser {
  final AuthRepository repository;

  const SaveActiveUser({required this.repository});

  Future<bool> execute(String token) => repository.saveUser(token);
}
