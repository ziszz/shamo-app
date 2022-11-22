import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/repositories/auth_repository_impl.dart';
import 'package:shamo_app/utilities/exceptions.dart';
import 'package:shamo_app/utilities/failure.dart';

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
      expect(result, const Right(testUser));
    });

    test(
        "should return server failure when the call remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getUser(testToken))
          .thenThrow(ServerException());
      // act
      final result = await repository.getUser(testToken);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
