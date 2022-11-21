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
}
