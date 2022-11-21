import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepository repository;
  late MockProductRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    repository = ProductRepository(
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
      expect(resultList, testProductList);
    });
  });
}
