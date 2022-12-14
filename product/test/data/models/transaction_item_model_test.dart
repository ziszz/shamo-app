import 'package:flutter_test/flutter_test.dart';
import 'package:product/data/models/transaction_item_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Transaction Item Model", () {
    test("should return a valid Model from JSON", () async {
      // act
      const Map<String, dynamic> jsonMap = testTransactionItemJson;
      final result = TransactionItemModel.fromJson(jsonMap);
      // assert
      expect(result, testTransactionItemModel);
    });

    test("should return a JSON map containing proper data", () async {
      // act
      const expectedJson = testTransactionItemJson;
      final result = testTransactionItemModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return subclass of TransactionItem entity", () async {
      // act
      final result = testTransactionItemModel.toEntity();
      // assert
      expect(result, testTransactionItem);
    });
  });
}
