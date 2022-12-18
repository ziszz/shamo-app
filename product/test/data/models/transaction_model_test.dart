import 'package:flutter_test/flutter_test.dart';
import 'package:product/data/models/transaction_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  group("Transaction Model", () {
    test("should return a valid Model from JSON", () async {
      // act
      const Map<String, dynamic> jsonMap = testTransactionJson;
      final result = TransactionModel.fromJson(jsonMap);
      // assert
      expect(result, testTransactionModel);
    });

    test("should return a JSON map containing proper data", () async {
      // act
      const expectedJson = testTransactionJson;
      final result = testTransactionModel.toJson();
      // assert
      expect(result, expectedJson);
    });

    test("should return a subclass of Transacton entity", () async {
      // act
      final result = testTransactionModel.toEntity();
      // assert
      expect(result, testTransaction);
    });
  });
}
