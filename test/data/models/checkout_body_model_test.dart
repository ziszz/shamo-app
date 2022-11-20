import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return json containing proper data", () async {
    const expectedJson = testCheckoutBodyJson;
    final result = testCheckoutBodyModel.toJson();
    expect(result, expectedJson);
  });
}
