import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/get_active_user.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetActiveUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetActiveUser(mockAuthRepository);
  });

  group("Get Active User use case", () {
    test(
        "should return token data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.getActiveUser())
          .thenAnswer((_) async => const Right(testUser));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should cache failure data when get data from the repository is failed",
        () async {
      // arrange
      when(mockAuthRepository.getActiveUser()).thenAnswer(
          (_) async => const Left(CacheFailure(Constants.cacheEmptyMessage)));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, const Left(CacheFailure(Constants.cacheEmptyMessage)));
    });
  });
}
