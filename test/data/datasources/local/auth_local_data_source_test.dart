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
      prefs: prefs,
    );
  });

  const testToken = "access_token";

  group("Cache token", () {
    test("should return true when cache token is successfuly", () async {
      // arrange
      SharedPreferences.setMockInitialValues({});
      // act
      final result = await localDataSource.cacheToken(testToken);
      // assert
      expect(result, Constants.saveTokenMessage);
    });

    test("should return true when remove token from cache is successfuly",
        () async {
      // arrange
      SharedPreferences.setMockInitialValues({Constants.tokenKey: testToken});
      // act
      final result = await localDataSource.removeCache();
      // assert
      expect(result, Constants.removeTokenMessage);
    });
  });
}
