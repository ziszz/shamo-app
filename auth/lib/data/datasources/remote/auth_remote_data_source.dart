import 'dart:convert';

import 'package:auth/data/model/user_model.dart';
import 'package:core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';

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
  final IOClient _client;

  const AuthRemoteDataSourceImpl(this._client);

  @override
  Future<UserModel> register(
      String name, String email, String username, String password) async {
    final body = {
      "name": name,
      "email": email,
      "username": username,
      "password": password,
    };

    final response = await _client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/register"),
      body: body,
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final result = UserModel.fromJson(
          responseBody["data"]["access_token"], responseBody["data"]["user"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final body = {"email": email, "password": password};
    final response = await _client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/login"),
      body: body,
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final result = UserModel.fromJson(
          responseBody["data"]["access_token"], responseBody["data"]["user"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> logout(String token) async {
    final headers = {"Authorization": "Bearer $token"};
    final response = await _client.post(
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

    final response = await _client.post(
      Uri.parse("${dotenv.env["apiUrl"]}/api/user"),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final result =
          UserModel.fromJson(token, jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String token) async {
    final headers = {"Authorization": "Bearer $token"};
    final response = await _client
        .get(Uri.parse("${dotenv.env["apiUrl"]}/api/user"), headers: headers);

    if (response.statusCode == 200) {
      final result =
          UserModel.fromJson(token, jsonDecode(response.body)["data"]);
      return result;
    } else {
      throw ServerException();
    }
  }
}
