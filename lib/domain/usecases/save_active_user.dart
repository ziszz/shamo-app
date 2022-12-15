import 'package:shamo_app/domain/repositories/auth_repository.dart';

class SaveActiveUser {
  final AuthRepository _repository;

  const SaveActiveUser(this._repository);

  Future<bool> execute(String token) => _repository.cacheToken(token);
}
