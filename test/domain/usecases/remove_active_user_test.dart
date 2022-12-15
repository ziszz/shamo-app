import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shamo_app/domain/usecases/remove_active_user.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveActiveUser usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = RemoveActiveUser(
      repository: mockAuthRepository,
    );
  });

  group("Remove active user use case", () {
    test("should return true when get data from repository is successfuly",
        () async {
      // arrange
      when(mockAuthRepository.clearTokenCache()).thenAnswer((_) async => true);
      // act
      final result = await usecase.execute();
      // assert
      expect(result, true);
    });
  });
}
