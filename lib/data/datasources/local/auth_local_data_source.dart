import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<String> cacheToken(String token);
  Future<String> removeCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences prefs;

  const AuthLocalDataSourceImpl({required this.prefs});

  @override
  Future<String> cacheToken(String token) async {
    await prefs.setString(Constants.tokenKey, token);
    return Constants.saveTokenMessage;
  }

  @override
  Future<String> removeCache() async {
    await prefs.remove(Constants.tokenKey);
    return Constants.removeTokenMessage;
  }
}
