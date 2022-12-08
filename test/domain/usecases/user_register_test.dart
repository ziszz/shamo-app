import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/user_register.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserRegister usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserRegister(
      repository: mockAuthRepository,
    );
  });

  const testName = "Zis";
  const testEmail = "abdaziz1181@gmail.com";
  const testUsername = "abdaziz1181";
  const testPass = "12345678";

  group("User Register use case", () {
    test("should get user data when get from repository is successful",
        () async {
      // arrange
      when(mockAuthRepository.register(
              testName, testEmail, testUsername, testPass))
          .thenAnswer((_) async => const Right(testUserFromUserReponse));
      // act
      final result =
          await usecase.execute(testName, testEmail, testUsername, testPass);
      // assert
      expect(result, const Right(testUserFromUserReponse));
    });

    test("should get failure message when get from repository is failed",
        () async {
      // arrange
      when(mockAuthRepository.register(
              testName, testEmail, testUsername, testPass))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result =
          await usecase.execute(testName, testEmail, testUsername, testPass);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
