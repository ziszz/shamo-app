import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/user_logout.dart';
import 'package:shamo_app/utilities/constants.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserLogout useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = UserLogout(
      repository: mockAuthRepository,
    );
  });

  const testToken = "access_token";

  group("User Logout Use Case", () {
    test("should return true when get data from the repository is successful",
        () async {
      // arrange
      when(mockAuthRepository.logout(testToken))
          .thenAnswer((_) async => const Right(true));
      // act
      final result = await useCase.execute(testToken);
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
      final result = await useCase.execute(testToken);
      // assert
      expect(
          result, const Left(ServerFailure(Constants.unauthenticatedMessage)));
    });
  });
}
