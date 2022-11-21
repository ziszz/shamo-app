import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/category_response.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group('Category Response', () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testCategoryResponseJson;
      final result = CategoryResponse.fromJson(jsonMap).catagoryList;
      // assert
      expect(result, testCategoryResponse);
    });
  });
}
