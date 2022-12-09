import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/save_user.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = SaveUser(
      repository: mockAuthRepository,
    );
  });

  const testToken = "access_token";

  group("Save user use case", () {
    test("should return true when get data from repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.saveUser(testToken))
          .thenAnswer((_) async => true);
      // act
      final result = await usecase.execute(testToken);
      // assert
      expect(result, true);
    });
  });
}
