import 'package:core/utilities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/domain/usecases/get_products.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProducts usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProducts(mockProductRepository);
  });

  group("Get Products use case", () {
    test(
        "should return product data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockProductRepository.getProducts())
          .thenAnswer((_) async => const Right([testProduct]));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Right([testProduct]));
    });

    test(
        "should return server failure when get data from the repository is failed",
        () async {
      // arrange
      when(mockProductRepository.getProducts())
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
