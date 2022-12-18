import 'package:auth/domain/usecases/user_login.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserLogin usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserLogin(mockAuthRepository);
  });

  const testEmail = "abdaziz1181@gmail.com";
  const testPass = "12345678";

  group("User Login use case", () {
    test("should get user data when get data from the repository is successful",
        () async {
      // arrange
      when(mockAuthRepository.login(testEmail, testPass))
          .thenAnswer((_) async => const Right(testUser));
      // act
      final result = await usecase.execute(testEmail, testPass);
      // assert
      expect(result, const Right(testUser));
    });

    test(
        "should get failure message when get data from the repository is failed",
        () async {
      // arrange
      when(mockAuthRepository.login(testEmail, testPass))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute(testEmail, testPass);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}
