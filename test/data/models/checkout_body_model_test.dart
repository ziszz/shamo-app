import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Checkout Body Model", () {
    test("should return json containing proper data", () async {
      // act
      const expectedJson = testCheckoutBodyJson;
      final result = testCheckoutBodyModel.toJson();
      // assert
      expect(result, expectedJson);
    });
  });
}
