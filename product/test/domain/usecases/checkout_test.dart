import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/domain/usecases/checkout.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late Checkout usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = Checkout(mockProductRepository);
  });

  const testToken = "access_token";

  group("Checkout use case", () {
    test(
        "should return checkout status when post and get data from repository is successfuly",
        () async {
      // arrange
      when(mockProductRepository.checkout(testToken, testCheckoutBody))
          .thenAnswer((_) async => const Right("success"));
      // act
      final result = await usecase.execute(testToken, testCheckoutBody);
      // assert
      expect(result, const Right("success"));
    });

    test(
        "should return server failure when post and get data from repository is failed",
        () async {
      // arrange
      when(mockProductRepository.checkout(testToken, testCheckoutBody))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute(testToken, testCheckoutBody);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
