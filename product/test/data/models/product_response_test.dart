import 'package:flutter_test/flutter_test.dart';
import 'package:product/data/models/product_response.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Product Response", () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testProductResponseJson;
      final result = ProductResponse.fromJson(jsonMap).productList;
      // assert
      expect(result, testProductResponse);
    });
  });
}
