import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/transaction_model.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return a valid Model from JSON", () async {
    const Map<String, dynamic> jsonMap = testTransactionJson;
    final result = TransactionModel.fromJson(jsonMap);
    expect(result, testTransactionModel);
  });

  test("should return a JSON map containing proper data", () async {
    const expectedJson = testTransactionJson;
    final result = testTransactionModel.toJson();
    expect(result, expectedJson);
  });
}