import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/product_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Product Model", () {
    test("should return a valid Model from JSON", () async {
      // act
      const Map<String, dynamic> jsonMap = testProductJson;
      final result = ProductModel.fromJson(jsonMap);
      // assert
      expect(result, testProductModel);
    });

    test("should return a JSON map containing proper data", () async {
      // act
      const expectedJson = testProductJson;
      final result = testProductModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return subclass of Product entity", () async {
      // act
      final result = testProductModel.toEntity();
      // assert
      expect(result, testProduct);
    });
  });
}
