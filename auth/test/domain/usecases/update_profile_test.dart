import 'package:auth/domain/usecases/update_profile.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UpdateProfile usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UpdateProfile(mockAuthRepository);
  });

  const testToken = "access_token";
  const testName = "Zis";
  const testEmail = "abdaziz1181@gmail.com";
  const testUsername = "abdaziz1181";

  group("Update Profile use case", () {
    test(
        "should return user data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.updateProfile(
              testToken, testName, testEmail, testUsername))
          .thenAnswer((_) async => const Right(testUser));
      // act
      final result =
          await usecase.execute(testToken, testName, testEmail, testUsername);
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should return failure message when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.updateProfile(
              testToken, testName, testEmail, testUsername))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result =
          await usecase.execute(testToken, testName, testEmail, testUsername);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
