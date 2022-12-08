import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/user_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("User Model", () {
    test("should return a valid Model from JSON", () async {
      // act
      const testToken = "access_token";
      const jsonMap = testUserJson;
      final result = UserModel.fromJson(testToken, jsonMap);
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

    test("should return a subclass of User entity", () async {
      // act
      final result = testUserModel.toEntity();
      // assert
      expect(result, testUser);
    });
  });
}
