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

  group("get Product", () {
    test("should return list of Product Model when the response code is 200",
        () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/product.json"), 200));
      final result = await dataSource.getProduct();
      expect(result, equals(testProductModelList));
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env['apiUrl']}/api/products")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.getProduct();
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
