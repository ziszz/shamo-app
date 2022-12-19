import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/domain/usecases/get_product_categories.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProductCategories usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetProductCategories(mockProductRepository);
  });

  group("Get Product Categories use case", () {
    test(
        "should return categories data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockProductRepository.getProductCategories())
          .thenAnswer((_) async => const Right([testCategory]));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Right([testCategory]));
    });

    test(
        "should return server failure when get data from the repository is failed",
        () async {
      // arrange
      when(mockProductRepository.getProductCategories())
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
