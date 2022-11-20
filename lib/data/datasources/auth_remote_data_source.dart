import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/utilities/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<bool> logout(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final IOClient client;

  const AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> logout(String token) async {
    final response =
        await client.post(Uri.parse("${dotenv.env["apiUrl"]}/api/logout"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      return result;
    } else {
      throw ServerException();
    }
  }
}
