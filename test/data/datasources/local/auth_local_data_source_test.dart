import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late AuthLocalDataSource localDataSource;

  setUp(() async {
    prefs = await SharedPreferences.getInstance();
    localDataSource = AuthLocalDataSourceImpl(
      userPrefs: prefs,
    );
    SharedPreferences.setMockInitialValues({});
  });

  const testToken = "access_token";

  group("User Preferences", () {
    test("should cache token", () async {
      final result = await localDataSource.cacheToken(testToken);
      expect(result, true);
    });

    test("should remove token from cache", () async {
      final result = await localDataSource.removeCache(Constants.tokenKey);
      expect(result, true);
    });
  });
}
