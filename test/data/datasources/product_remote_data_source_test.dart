import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/utilities/exceptions.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late ProductRemoteDataSourceImpl dataSource;
  late MockIOClient mockIOClient;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad();

    mockIOClient = MockIOClient();
    dataSource = ProductRemoteDataSourceImpl(
      client: mockIOClient,
    );
  });

  const testToken = "access_token";
  const testHeaders = {
    "Accept": "application/json",
    "Authorization": "Bearer $testToken",
  };

  group("Product", () {
    test("should return list of Product Model when the response code is 200",
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/product.json"), 200));
      // act
      final result = await dataSource.getProducts();
      // assert
      expect(result, equals(testProductModelList));
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.getProducts();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Product Categories", () {
    test("should return list of Category Model when the response code is 200",
        () async {
      // arrange
      when(mockIOClient
              .get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/category.json"), 200));
      // act
      final result = await dataSource.getProductCategories();
      // assert
      expect(result, testCategoryModelList);
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient
              .get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.getProductCategories();
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Transactions", () {
    const testId = 1;

    test("should return a valid Model from JSON", () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse("${dotenv.env["apiUrl"]}/api/transactions?id=$testId"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/transactions.json"), 200));
      // act
      final result = await dataSource.getTransactions(testId, testToken);
      // assert
      expect(result, testTransactionModelList);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse("${dotenv.env["apiUrl"]}/api/transactions?id=$testId"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.getTransactions(testId, testToken);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Checkout", () {
    const testBody = testCheckoutBodyModel;
    test("should return a Checkout Response when the response code is 200",
        () async {
      // arrange
      when(mockIOClient.post(
        Uri.parse("${dotenv.env["apiUrl"]}/api/checkout"),
        body: jsonEncode(testBody.toJson()),
        headers: testHeaders,
      )).thenAnswer((_) async =>
          http.Response(readJson("dummy_data/checkout.json"), 200));
      // act
      final result = await dataSource.checkout(testToken, testBody);
      // assert
      expect(result, testCheckoutResponse);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.post(
        Uri.parse("${dotenv.env["apiUrl"]}/api/checkout"),
        body: jsonEncode(testBody.toJson()),
        headers: testHeaders,
      )).thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.checkout(testToken, testBody);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
