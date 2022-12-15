import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheToken(String token);
  Future<bool> clearTokenCache();
  Future<String> getCacheToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  const AuthLocalDataSourceImpl({required this.prefs});

  @override
  Future<bool> cacheToken(String token) async {
    return await prefs.setString(Constants.tokenKey, token);
  }

  @override
  Future<bool> clearTokenCache() async {
    return await prefs.remove(Constants.tokenKey);
  }

  @override
  Future<String> getCacheToken() async {
    return prefs.getString(Constants.tokenKey) ?? "";
  }
}
