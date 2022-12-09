import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheToken(String token);
  Future<bool> removeCache(String key);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences userPrefs;

  const AuthLocalDataSourceImpl({required this.userPrefs});

  @override
  Future<bool> cacheToken(String token) async {
    return await userPrefs.setString(Constants.tokenKey, token);
  }

  @override
  Future<bool> removeCache(String key) async {
    return await userPrefs.remove(key);
  }
}
