import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/gallery_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Gallery Model", () {
    test("should return a valid Mode from JSON", () async {
      const jsonMap = testGalleryJson;
      final result = GalleryModel.fromJson(jsonMap);
      expect(result, testGalleryModel);
    });

    test("should return json containing proper data", () async {
      const expectedJson = testGalleryJson;
      final result = testGalleryModel.toJson();
      expect(result, expectedJson);
    });
  });
}
