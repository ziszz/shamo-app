import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shamo_app/data/datasources/auth_remote_data_source.dart';
import 'package:shamo_app/utilities/exceptions.dart';

import '../../dummy_data/dummy_object.dart';
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

  const testToken = "access_token";
  const testHeaders = {"Authorization": "Bearer $testToken"};

  group("get User", () {
    test("should return User Model when the response code is 200", () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      final result = await dataSource.getUser(testToken);
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.getUser(testToken);
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
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
              body: jsonEncode(testBody)))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      final result = await dataSource.register(
          testName, testEmail, testUsername, testPass);
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
              body: jsonEncode(testBody)))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result =
          dataSource.register(testName, testEmail, testUsername, testPass);
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Login", () {
    const testEmail = "abdaziz1181@gmail.com";
    const testPass = "12345678";

    const testBody = {"email": testEmail, "password": testPass};

    test("should return User Model when the response code is 200", () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
              body: jsonEncode(testBody)))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      final result = await dataSource.login(testEmail, testPass);
      expect(result, testUserModel);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
              body: jsonEncode(testBody)))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.login(testEmail, testPass);
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
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              body: jsonEncode(testBody), headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/user.json"), 200));
      final result = await dataSource.updateProfile(
          testToken, testName, testEmail, testUsername);
      expect(result, testUserModel);
    });

    test('should throw server exceptio when the response code is 404 or other',
        () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
              body: jsonEncode(testBody), headers: testHeaders))
          .thenAnswer((_) async => http.Response("NotFound", 404));
      final result = dataSource.updateProfile(
          testToken, testName, testEmail, testUsername);
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group("Logout", () {
    test("should return true when the response code is 200", () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout"),
              headers: testHeaders))
          .thenAnswer((_) async =>
              http.Response(readJson("dummy_data/logout.json"), 200));
      final result = await dataSource.logout(testToken);
      expect(result, true);
    });

    test("should throw server exception when the response code is 404 or other",
        () async {
      when(mockIOClient.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout"),
              headers: testHeaders))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      final result = dataSource.logout(testToken);
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
