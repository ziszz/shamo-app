import 'package:shamo_app/domain/repositories/auth_repository.dart';

class GetActiveUser {
  final AuthRepository _repository;

  const GetActiveUser(this._repository);

  Future<String> execute() => _repository.getCacheToken();
}
