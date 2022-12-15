import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<void> clearTokenCache();
  Future<String> getCacheToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _prefs;

  const AuthLocalDataSourceImpl(this._prefs);

  @override
  Future<void> cacheToken(String token) async {
    await _prefs.setString(Constants.tokenKey, token);
  }

  @override
  Future<void> clearTokenCache() async {
    await _prefs.remove(Constants.tokenKey);
  }

  @override
  Future<String> getCacheToken() async {
    return _prefs.getString(Constants.tokenKey) ?? "";
  }
}
