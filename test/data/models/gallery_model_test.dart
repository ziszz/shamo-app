import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/gallery_model.dart';

import '../../../auth/test/dummy_data/dummy_object.dart';

void main() {
  group("Gallery Model", () {
    test("should return a valid Mode from JSON", () async {
      // act
      const jsonMap = testGalleryJson;
      final result = GalleryModel.fromJson(jsonMap);
      // assert
      expect(result, testGalleryModel);
    });

    test("should return json containing proper data", () async {
      // act
      const expectedJson = testGalleryJson;
      final result = testGalleryModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return subclass of Gallery entity", () async {
      // act
      final result = testGalleryModel.toEntity();
      // assert
      expect(result, testGallery);
    });
  });
}
