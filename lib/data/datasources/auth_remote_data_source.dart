import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/models/user_model.dart';
import 'package:shamo_app/utilities/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> getUser(String token);
  Future<UserModel> register(
      String name, String email, String username, String password);
  Future<UserModel> login(String email, String password);
  Future<UserModel> updateProfile(
      String token, String name, String email, String username);
  Future<bool> logout(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final IOClient client;

  const AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> register(
      String name, String email, String username, String password) async {
    final body = {
      "name": name,
      "email": email,
      "username": username,
      "password": password,
    };

    final response = await client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final result = UserModel.fromJson(jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final body = {"email": email, "password": password};
    final response = await client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final result = UserModel.fromJson(jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> logout(String token) async {
    final headers = {"Authorization": "Bearer $token"};
    final response = await client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/logout"),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> updateProfile(
      String token, String name, String email, String username) async {
    final headers = {"Authorization": "Bearer $token"};
    final body = {
      "name": name,
      "email": email,
      "username": username,
    };

    final response = await client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
      body: jsonEncode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result = UserModel.fromJson(jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String token) async {
    final headers = {"Authorization": "Bearer $token"};
    final response = await client
        .get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"), headers: headers);

    if (response.statusCode == 200) {
      final result = UserModel.fromJson(jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }
}
