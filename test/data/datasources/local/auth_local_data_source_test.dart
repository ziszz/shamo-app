import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/datasources/local/auth_local_data_source.dart';
import 'package:shamo_app/utilities/exceptions.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockUserPreferences mockUserPreferences;
  late AuthLocalDataSource localDataSource;

  const testToken = "access_token";

  setUp(() async {
    mockUserPreferences = MockUserPreferences();
    localDataSource = AuthLocalDataSourceImpl(mockUserPreferences);
  });

  group("Get Token Cache", () {
    test("should return user token when get data is successfuly", () async {
      when(mockUserPreferences.getCacheToken())
          .thenAnswer((_) async => testToken);
      // act
      final result = await localDataSource.getCacheToken();
      // assert
      expect(result, testToken);
    });

    test("should throw cache exception when get data is failed", () async {
      when(mockUserPreferences.getCacheToken()).thenThrow(Exception());
      // act
      final result = localDataSource.getCacheToken();
      // assert
      expect(result, throwsA(isA<CacheException>()));
    });
  });

  group("Cache token", () {
    test("should cache data locally when call is successful", () async {
      //act
      localDataSource.cacheToken(testToken);
      // assert
      verify(mockUserPreferences.cacheToken(testToken));
    });
  });

  group("Clear Token Cache", () {
    test("should return true when remove token from cache is successfuly",
        () async {
      //act
      localDataSource.clearTokenCache();
      // assert
      verify(mockUserPreferences.clearTokenCache());
    });
  });
}
