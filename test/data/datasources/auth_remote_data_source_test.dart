import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/utilities/exceptions.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockIOClient mockIOClient;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad();

    mockIOClient = MockIOClient();
    dataSource = AuthRemoteDataSourceImpl(
      client: mockIOClient,
    );
  });

  group("Login", () {});

  group("Logout", () {
    const token = "22758|zI1Rm0NSzxm7l5MODP6c7rzR4ps0Qcpwwla1qsiU";
    test("should return true when the response code is 200", () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout")))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/logout.json"), 200));
      final result = await dataSource.logout(token);
      expect(result, true);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout")))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.logout(token);
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
