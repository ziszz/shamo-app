import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/user_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return a valid Model when the response code is 200", () async {
    const jsonMap = testUserLoginJson;
    final result = UserModel.fromJson(jsonMap);
    expect(result, testUserLoginModel);
  });

  test("should return json containing proper data", () async {
    const expectedJson = testUserLoginJson;
    final result = testUserLoginModel.toJson();
    expect(result, expectedJson);
  });
}
