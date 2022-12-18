import 'package:auth/domain/usecases/user_logout.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserLogout usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserLogout(mockAuthRepository);
  });

  const testToken = "access_token";

  group("User Logout use case", () {
    test("should return true when get data from the repository is successful",
        () async {
      // arrange
      when(mockAuthRepository.logout(testToken))
          .thenAnswer((_) async => const Right(true));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, const Right(true));
    });

    test(
        "should return failure message when get data from the repository is failed",
        () async {
      // arrange
      when(mockAuthRepository.logout(testToken)).thenAnswer((_) async =>
          const Left(ServerFailure(Constants.unauthenticatedMessage)));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(
          result, const Left(ServerFailure(Constants.unauthenticatedMessage)));
    });
  });
}
