import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/repositories/auth_repository_impl.dart';
import 'package:shamo_app/utilities/constants.dart';
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

  const testToken = "access_token";
  const testName = "Zis";
  const testEmail = "abdaziz1181@gmail.com";
  const testUsername = "abdaziz1181";
  const testPass = "12345678";

  group("User", () {
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

  group("Register", () {
    test(
        "should return remote data when the call remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.register(
              testName, testEmail, testUsername, testPass))
          .thenAnswer((_) async => testUserModel);
      // act
      final result = await repository.register(
          testName, testEmail, testUsername, testPass);
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should return server failure when the call remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.register(
              testName, testEmail, testUsername, testPass))
          .thenThrow(ServerException());
      // act
      final result = await repository.register(
          testName, testEmail, testUsername, testPass);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Login", () {
    const testEmail = "abdaziz1181@gmail.com";
    const testPass = "12345678";

    test(
        "should return remote data when the call remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.login(testEmail, testPass))
          .thenAnswer((_) async => testUserModel);
      // act
      final result = await repository.login(testEmail, testPass);
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should return server failure when the call remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.login(testEmail, testPass))
          .thenThrow(ServerException());
      // act
      final result = await repository.login(testEmail, testPass);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Update Profile", () {
    test(
        "should return remote data when the call remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.updateProfile(
              testToken, testName, testEmail, testUsername))
          .thenAnswer((_) async => testUserModel);
      // act
      final result = await repository.updateProfile(
          testToken, testName, testEmail, testUsername);
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should return server failure when the call remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.updateProfile(
              testToken, testName, testName, testUsername))
          .thenThrow(ServerException());
      // act
      final result = await repository.updateProfile(
          testToken, testName, testName, testUsername);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Logout", () {
    test(
        "should return remote data when the call remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.logout(testToken))
          .thenAnswer((_) async => true);
      // act
      final result = await repository.logout(testToken);
      // assert
      expect(result, const Right(true));
    });

    test(
        "should return server exception when the call remote datasource is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.logout(testToken)).thenThrow(ServerException());
      // act
      final result = await repository.logout(testToken);
      // assert
      expect(
          result, const Left(ServerFailure(Constants.unauthenticatedMessage)));
    });
  });

  group("Cache User Token", () {
    test(
        "should return true when the call to local data source is successfully",
        () async {});
  });
}
