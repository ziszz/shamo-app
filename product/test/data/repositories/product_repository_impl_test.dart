import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/data/repositories/product_repository_impl.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    repository = ProductRepositoryImpl(mockRemoteDataSource);
  });

  const testToken = "access_token";

  group("Products", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getProducts())
          .thenAnswer((_) async => testProductModelList);
      // act
      final result = await repository.getProducts();
      final resultList = result.getOrElse(() => []);
      // assert
      expect(resultList, [testProduct]);
    });

    test(
        "should return server failure when the call to remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getProducts()).thenThrow(ServerException());
      // act
      final result = await repository.getProducts();
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Products By Category", () {
    const testCategoryId = 1;

    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getProductsByCategory(testCategoryId))
          .thenAnswer((_) async => testProductModelList);
      // act
      final result = await repository.getProductsByCategory(testCategoryId);
      final resultList = result.getOrElse(() => []);
      // assert
      expect(resultList, [testProduct]);
    });

    test(
        "should return server failure when the call to remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getProductsByCategory(testCategoryId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getProductsByCategory(testCategoryId);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Product Categories", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getProductCategories())
          .thenAnswer((_) async => testCategoryModelList);
      // act
      final result = await repository.getProductCategories();
      final resultList = result.getOrElse(() => []);
      // assert
      expect(resultList, [testCategory]);
    });

    test(
        "should return server failure when the call to remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getProductCategories())
          .thenThrow(ServerException());
      // act
      final result = await repository.getProductCategories();
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Transaction", () {
    test(
        "should return remote data when call to the remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getTransactions(testToken))
          .thenAnswer((_) async => testTransactionModelList);
      // act
      final result = await repository.getTransactions(testToken);
      final resultList = result.getOrElse(() => []);
      // assert
      expect(resultList, [testTransaction]);
    });

    test(
        "should return server failure when call to the remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getTransactions(testToken))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTransactions(testToken);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  group("Checkout", () {
    test(
        "should return remote data when send data to remote data source successful",
        () async {
      // arrange
      when(mockRemoteDataSource.checkout(testToken, testCheckoutBodyModel))
          .thenAnswer((_) async => testCheckoutResponse);
      // act
      final result = await repository.checkout(testToken, testCheckoutBody);
      // assert
      expect(result, Right(testCheckoutResponse.status));
    });

    test(
        "should return server failure when send data to remote data source successful",
        () async {
      // arrange
      when(mockRemoteDataSource.checkout(testToken, testCheckoutBodyModel))
          .thenThrow(ServerException());
      // act
      final result = await repository.checkout(testToken, testCheckoutBody);
      // assert
      expect(
          result, const Left(ServerFailure(Constants.checkoutFailedMessage)));
    });
  });
}
