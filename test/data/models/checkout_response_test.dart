import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/checkout_response.dart';

import '../../../auth/test/dummy_data/dummy_object.dart';

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
