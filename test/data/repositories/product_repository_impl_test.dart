import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/repositories/product_repository_impl.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepository repository;
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
  });
}
