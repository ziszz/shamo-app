import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/get_active_user.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetActiveUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = GetActiveUser(mockAuthRepository);
  });

  const testToken = "access_token";

  group("Get Active User use case", () {
    test(
        "should return token data when get data from the repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.getCacheToken())
          .thenAnswer((_) async => testToken);
      // act
      final result = await usecase.execute();
      // assert
      expect(result, testToken);
    });
  });
}
