import 'package:auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_object.dart';
import '../../../helpers/test_helper.mocks.dart';
import '../../../json_reader.dart';

void main() {
  late AuthRemoteDataSource dataSource;
  late MockIOClient mockIOClient;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    dotenv.testLoad();

    mockIOClient = MockIOClient();
    dataSource = AuthRemoteDataSourceImpl(mockIOClient);
  });

  const testToken = "access_token";
  const testHeaders = {"Authorization": "Bearer $testToken"};

  group("User", () {
    test("should return User Model when the response code is 200", () async {
      // arrange
      when(mockIOClient.get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      // act
      final result = await dataSource.getUser(testToken);
      // assert
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.getUser(testToken);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Register", () {
    const testName = "Zis";
    const testEmail = "abdaziz1181@gmail.com";
    const testUsername = "abdaziz1181";
    const testPass = "12345678";

    const testBody = {
      "name": testName,
      "email": testEmail,
      "username": testUsername,
      "password": testPass,
    };

    test("should return User Model when the response code is 200", () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
              body: testBody))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/login_register.json"), 200));
      // act
      final result = await dataSource.register(
          testName, testEmail, testUsername, testPass);
      // assert
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
              body: testBody))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result =
          dataSource.register(testName, testEmail, testUsername, testPass);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Login", () {
    const testEmail = "abdaziz1181@gmail.com";
    const testPass = "12345678";

    const testBody = {"email": testEmail, "password": testPass};

    test("should return User Model when the response code is 200", () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
              body: testBody))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/login_register.json"), 200));
      // act
      final result = await dataSource.login(testEmail, testPass);
      // assert
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
              body: testBody))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.login(testEmail, testPass);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Update Profile", () {
    const testName = "Zis";
    const testEmail = "abdaziz1181@gmail.com";
    const testUsername = "abdaziz1181";

    const testBody = {
      "name": testName,
      "email": testEmail,
      "username": testUsername,
    };

    test('should return user model when the response code is 200', () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              body: testBody, headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      // act
      final result = await dataSource.updateProfile(
          testToken, testName, testEmail, testUsername);
      // assert
      expect(result, testUserModel);
    });

    test('should throw server exceptio when the response code is 404 or other',
        () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              body: testBody, headers: testHeaders))
          .thenAnswer((_) async => http.Response("NotFound", 404));
      // act
      final result = dataSource.updateProfile(
          testToken, testName, testEmail, testUsername);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Logout", () {
    test("should return true when the response code is 200", () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/logout.json"), 200));
      // act
      final result = await dataSource.logout(testToken);
      // assert
      expect(result, true);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      // arrange
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      // act
      final result = dataSource.logout(testToken);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
