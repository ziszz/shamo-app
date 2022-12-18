import 'package:flutter_test/flutter_test.dart';
import 'package:shamo_app/data/models/transaction_response.dart';

import '../../../auth/test/dummy_data/dummy_object.dart';

void main() {
  group("Transaction Response", () {
    test("should return a valid Model from JSON", () async {
      // act
      const jsonMap = testTransactionResponseJson;
      final result = TransactionResponse.fromJson(jsonMap).transactionList;
      // assert
      expect(result, testTransactionResponse);
    });
  });
}
