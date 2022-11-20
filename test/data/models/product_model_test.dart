import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/product_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Product Model", () {
    test("should return a valid Model from JSON", () async {
      const Map<String, dynamic> jsonMap = testProductJson;
      final result = ProductModel.fromJson(jsonMap);
      expect(result, testProductModel);
    });

    test("should return a JSON map containing proper data", () async {
      const expectedJson = testProductJson;
      final result = testProductModel.toJson();
      expect(result, expectedJson);
    });
  });
}
