import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return json containing proper data", () async {
    const expectedJson = testCheckoutItemJson;
    final result = testCheckoutItemModel.toJson();
    expect(result, expectedJson);
  });
}
