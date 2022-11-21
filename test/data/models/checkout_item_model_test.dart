import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Checkout Item Model", () {
    test("should return json containing proper data", () async {
      // act
      const expectedJson = testCheckoutItemJson;
      final result = testCheckoutItemModel.toJson();
      // assert
      expect(result, expectedJson);
    });
  });
}
