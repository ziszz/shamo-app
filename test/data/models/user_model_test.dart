import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should return a valid Model when the response code is 200", () async {
    const jsonMap = testUserJson;
    final result = UserModel.fromJson(jsonMap);
    expect(result, testUserModel);
  });
}
