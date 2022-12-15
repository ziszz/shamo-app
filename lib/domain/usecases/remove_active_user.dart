import 'package:shamo_app/domain/repositories/auth_repository.dart';

class RemoveActiveUser {
  final AuthRepository repository;

  const RemoveActiveUser({required this.repository});

  Future<bool> execute() => repository.clearTokenCache();
}
