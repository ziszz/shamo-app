import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:product/domain/usecases/get_transactions.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTransactions usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetTransactions(mockProductRepository);
  });

  const testToken = "access_token";

  group("Get Transactions use case", () {
    test(
        "should return transaction data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockProductRepository.getTransactions(testToken))
          .thenAnswer((_) async => const Right([testTransaction]));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, const Right([testTransaction]));
    });

    test(
        "should return server failure when get data from the repository is failed",
        () async {
      // arrange
      when(mockProductRepository.getTransactions(testToken))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
