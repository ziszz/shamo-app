import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;
  late AuthLocalDataSource localDataSource;

  const testToken = "access_token";

  setUp(() async {
    SharedPreferences.setMockInitialValues({Constants.tokenKey: testToken});
    prefs = await SharedPreferences.getInstance();
    localDataSource = AuthLocalDataSourceImpl(
      prefs: prefs,
    );
  });

  group("Get Token Cache", () {
    test("should return user token when get data is successfuly", () async {
      // act
      final result = await localDataSource.getCacheToken();
      // assert
      expect(result, testToken);
    });
  });

  group("Cache token", () {
    test("should return true when cache token is successfuly", () async {
      // act
      final result = await localDataSource.cacheToken(testToken);
      // assert
      expect(result, true);
    });
  });

  group("Clear Token Cache", () {
    test("should return true when remove token from cache is successfuly",
        () async {
      // act
      final result = await localDataSource.clearTokenCache();
      // assert
      expect(result, true);
    });
  });
}
