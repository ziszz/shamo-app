import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/transaction_response.dart';

import '../../dummy_data/dummy_object.dart';

void main() {
  test("should return a valid Model from JSON", () async {
    const jsonMap = testTransactionResponseJson;
    final result = TransactionResponse.fromJson(jsonMap).transactionList;
    expect(result, testTransactionResponse);
  });
}
