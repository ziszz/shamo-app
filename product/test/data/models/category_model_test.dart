import 'package:flutter_test/flutter_test.dart';
import 'package:product/data/models/category_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Category model", () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testCategoryJson;
      final result = CategoryModel.fromJson(jsonMap);
      // assert
      expect(result, testCategoryModel);
    });

    test("should return json containing proper data", () async {
      // act
      const expectedJson = testCategoryJson;
      final result = testCategoryModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return subclass of Category entity", () async {
      // act
      final result = testCategoryModel.toEntity();
      // assert
      expect(result, testCategory);
    });
  });
}
