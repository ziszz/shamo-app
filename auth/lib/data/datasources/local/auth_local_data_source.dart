import 'package:auth/data/datasources/preferences/user_preferences.dart';
import 'package:core/core.dart';

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
    final result = await _userPrefs.getCacheToken();

    if (result.isNotEmpty) {
      return result;
    } else {
      throw CacheException();
    }
  }
}
