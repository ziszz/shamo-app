import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/transaction_item_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Transaction Item Model", () {
    test("should return a valid Model from JSON", () async {
      const Map<String, dynamic> jsonMap = testTransactionItemJson;
      final result = TransactionItemModel.fromJson(jsonMap);
      expect(result, testTransactionItemModel);
    });

    test("should return a JSON map containing proper data", () async {
      const expectedJson = testTransactionItemJson;
      final result = testTransactionItemModel.toJson();
      expect(result, expectedJson);
    });
  });
}
