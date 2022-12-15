import 'package:shamo_app/domain/repositories/auth_repository.dart';

class RemoveActiveUser {
  final AuthRepository _repository;

  const RemoveActiveUser(this._repository);

  Future<bool> execute() => _repository.clearTokenCache();
}
