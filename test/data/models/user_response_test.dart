import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/user_response.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("User Response", () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testUserJson;
      final result = UserResponse.fromJson(jsonMap);
      // assert
      expect(result, testUserResponse);
    });

    test("should return json containing proper data", () async {
      // act
      const expectedJson = testUserJson;
      final result = testUserResponse.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return a subclass of User entity", () async {
      // act
      final result = testUserResponse.toEntity();
      // assert
      expect(result, testUser);
    });
  });
}
