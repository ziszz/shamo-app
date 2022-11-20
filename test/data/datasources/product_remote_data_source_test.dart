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
  const testHeaders = {"Authorization": "Bearer $testToken"};

  group("get Product", () {
    test("should return list of Product Model when the response code is 200",
        () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/product.json"), 200));
      final result = await dataSource.getProducts();
      expect(result, equals(testProductModelList));
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.getProducts();
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("get Product Categories", () {
    test("should return list of Category Model when the response code is 200",
        () async {
      when(mockIOClient
              .get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/category.json"), 200));
      final result = await dataSource.getProductCategories();
      expect(result, testCategoryModelList);
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      when(mockIOClient
              .get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.getProductCategories();
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("get Transaction", () {
    const testId = 1;

    test("should return a valid Model from JSON", () async {
      when(mockIOClient.get(
              Uri.parse("${dotenv.env["apiUrl"]}/api/transactions?id=$testId"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/transactions.json"), 200));
      final result = await dataSource.getTransactions(testId, testToken);
      expect(result, testTransactionModelList);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.get(
              Uri.parse("${dotenv.env["apiUrl"]}/api/transactions?id=$testId"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.getTransactions(testId, testToken);
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Checkout", () async {
    const testBody = {};
    test("should return a Transaction Model when the response code is 200",
        () async {
      when(mockIOClient.post(
        Uri.parse("${dotenv.env["checkout"]}"),
        body: testBody,
        headers: testHeaders,
      ));
      final result = await dataSource.checkout(testBody);
      expect(result, testTransactionModel);
    });
  });
}
