import 'package:shamo_app/data/datasources/preferences/user_preferences.dart';
import 'package:shamo_app/utilities/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<void> clearTokenCache();
  Future<String> getCacheToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final UserPreferences _userPrefs;

  const AuthLocalDataSourceImpl(this._userPrefs);

  @override
  Future<void> cacheToken(String token) async {
    await _userPrefs.cacheToken(token);
  }

  @override
  Future<void> clearTokenCache() async {
    await _userPrefs.clearTokenCache();
  }

  @override
  Future<String> getCacheToken() async {
    try {
      return _userPrefs.getCacheToken();
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
