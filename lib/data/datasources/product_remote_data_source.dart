import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/models/product_model.dart';
import 'package:shamo_app/data/models/product_response.dart';
import 'package:shamo_app/utilities/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final IOClient client;

  const ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse("${dotenv.env["apiUrl"]}/api/products"),
    );

    if (response.statusCode == 200) {
      final result =
          ProductResponse.fromJson(json.decode(response.body)).productList;
      return result;
    } else {
      throw ServerException();
    }
  }
}
