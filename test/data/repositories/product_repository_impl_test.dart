import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/repositories/product_repository_impl.dart';
import 'package:shamo_app/utilities/exceptions.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  const testToken = "access_token";

  group("Product", () {
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
    const testIdUser = 1;

    test(
        "should return remote data when call to the remote data source is successful",
        () async {
      // arrange
      when(mockRemoteDataSource.getTransactions(testIdUser, testToken))
          .thenAnswer((_) async => testTransactionModelList);
      // act
      final result = await repository.getTransactions(testIdUser, testToken);
      final resultList = result.getOrElse(() => []);
      // assert
      expect(resultList, [testTransaction]);
    });

    test(
        "should return server failure when call to the remote data source is failed",
        () async {
      // arrange
      when(mockRemoteDataSource.getTransactions(testIdUser, testToken))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTransactions(testIdUser, testToken);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });

  // group("Checkout", () {
  //   test(
  //       "should return Succes message when send data to remote data source successful",
  //       () async {
  //     // arrange
  //     when(mockRemoteDataSource.checkout(testToken, testCheckoutBodyModel))
  //         .thenAnswer((_) async => testTransactionModel);
  //     // act
  //     final result =
  //         await repository.checkout(testToken, testCheckoutBodyModel);
  //     // assert
  //     expect(result, const Right(Constants.checkoutSuccessMessage));
  //   });
  // });
}