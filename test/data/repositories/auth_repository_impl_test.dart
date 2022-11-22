import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group("User", () {
    const testToken = "access_token";

    test(
        "should return remote data when the call remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getUser(testToken))
          .thenAnswer((_) async => testUserModel);
      // act
      final result = await repository.getUser(testToken);
      // assert
      expect(result, testUser);
    });
  });
}
