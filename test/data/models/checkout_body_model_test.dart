import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/checkout_body_model.dart';

import '../../../auth/test/dummy_data/dummy_object.dart';

void main() {
  group("Checkout Body Model", () {
    test("should return json containing proper data", () async {
      // act
      const expectedJson = testCheckoutBodyJson;
      final result = testCheckoutBodyModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return a valid Model from Entity", () async {
      // act
      final result = CheckoutBodyModel.fromEntity(testCheckoutBody);
      // assert
      expect(result, testCheckoutBodyModel);
    });
  });
}
