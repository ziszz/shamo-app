import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/get_user.dart';
import 'package:shamo_app/utilities/failure.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetUser(
      repository: mockAuthRepository,
    );
  });

  const testToken = "access_token";

  group("Get User use case", () {
    test(
        "should return user data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.getUser(testToken))
          .thenAnswer((_) async => const Right(testUserFromUserModel));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, const Right(testUserFromUserModel));
    });

    test(
        "should return failure message when get data from the repository is failed",
        () async {
      // arrange
      when(mockAuthRepository.getUser(testToken))
          .thenAnswer((_) async => const Left(ServerFailure("")));
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, const Left(ServerFailure("")));
    });
  });
}