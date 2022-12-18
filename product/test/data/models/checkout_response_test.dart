import 'package:flutter_test/flutter_test.dart';
import 'package:product/data/models/checkout_response.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Checkout Response", () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testCheckoutJson;
      final result = CheckoutResponse.fromJson(jsonMap);
      // assert
      expect(result, testCheckoutResponse);
    });
  });
}
