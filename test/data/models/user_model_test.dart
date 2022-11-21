import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/user_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("User Model", () {
    test("should return a valid Model when the response code is 200", () async {
      // act
      const jsonMap = testUserJson;
      final result = UserModel.fromJson(jsonMap);
      // assert
      expect(result, testUserModel);
    });

    test("should return json containing proper data", () async {
      // act
      const expectedJson = testUserJson;
      final result = testUserModel.toJson();
      // assert
      expect(result, expectedJson);
    });
  });
}
