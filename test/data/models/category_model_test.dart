import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/category_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return a valid Model from JSON", () async {
    const jsonMap = testCategoryJson;
    final result = CategoryModel.fromJson(jsonMap);
    expect(result, testCategoryModel);
  });

  test("should return json containing proper data", () async {
    const expectedJson = testCategoryJson;
    final result = testCategoryModel.toJson();
    expect(result, expectedJson);
  });
}
