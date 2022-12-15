import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  final SharedPreferences _prefs;

  const UserPreferences(this._prefs);

  Future<void> cacheToken(String token) async {
    await _prefs.setString(Constants.tokenKey, token);
  }

  Future<void> clearTokenCache() async {
    await _prefs.remove(Constants.tokenKey);
  }

  Future<String> getCacheToken() async {
    return _prefs.getString(Constants.tokenKey) ?? "";
  }
}
