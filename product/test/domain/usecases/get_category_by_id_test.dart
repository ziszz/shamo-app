import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/domain/usecases/get_category_by_id.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCategoryById usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetCategoryById(mockProductRepository);
  });

  const testCategoryId = 1;

  group("Get Category By Id use case", () {
    test(
        "should return category data when get data from the repostory is successfuly",
        () async {
      // arrange
      when(mockProductRepository.getProductCategoryById(testCategoryId))
          .thenAnswer((_) async => const Right(testCategory));
      // act
      final result = await usecase.execute(testCategoryId);
      // assert
      expect(result, const Right(testCategory));
    });

    test(
        "should return server failure when get data from the repostory is failed",
        () async {
      // arrange
      when(mockProductRepository.getProductCategoryById(testCategoryId))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute(testCategoryId);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
