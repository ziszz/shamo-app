import 'package:shamo_app/domain/repositories/auth_repository.dart';

class SaveUser {
  final AuthRepository repository;

  const SaveUser({required this.repository});

  Future<bool> execute(String token) => repository.saveUser(token);
}
