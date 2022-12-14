import 'package:auth/data/repositories/auth_repository_impl.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late AuthRepositoryImpl repository;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockLocalDataSource = MockAuthLocalDataSource();
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
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
      verify(mockLocalDataSource.cacheToken(testToken));
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
      verify(mockLocalDataSource.cacheToken(testToken));
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
      verify(mockLocalDataSource.clearTokenCache());
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

  group("Get cache token", () {
    test(
        "should return user data when the call to local data source is successfuly",
        () async {
      // arrange
      when(mockLocalDataSource.getCacheToken())
          .thenAnswer((_) async => testToken);
      when(mockRemoteDataSource.getUser(testToken))
          .thenAnswer((_) async => testUserModel);
      // act
      final result = await repository.getActiveUser();
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should return cache failure when the call local data source is failed",
        () async {
      // arrange
      when(mockLocalDataSource.getCacheToken()).thenThrow(CacheException());
      // act
      final result = await repository.getActiveUser();
      // assert
      expect(result, const Left(CacheFailure(Constants.cacheEmptyMessage)));
    });
  });
}
