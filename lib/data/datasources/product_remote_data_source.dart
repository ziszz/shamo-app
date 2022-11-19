import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';
import 'package:shamo_app/data/models/category_model.dart';
import 'package:shamo_app/data/models/category_response.dart';
import 'package:shamo_app/data/models/product_model.dart';
import 'package:shamo_app/data/models/product_response.dart';
import 'package:shamo_app/data/models/transaction_model.dart';
import 'package:shamo_app/data/models/transaction_response.dart';
import 'package:shamo_app/utilities/exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<CategoryModel>> getProductCategories();
  Future<List<TransactionModel>> getTransactions();
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

  @override
  Future<List<CategoryModel>> getProductCategories() async {
    final response =
        await client.get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories"));

    if (response.statusCode == 200) {
      final result =
          CategoryResponse.fromJson(json.decode(response.body)).catagoryList;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final response =
        await client.get(Uri.parse("${dotenv.env["apiUrl"]}/api/transactions"));

    if (response.statusCode == 200) {
      final result = TransactionResponse.fromJson(json.decode(response.body))
          .transactionList;
      return result;
    } else {
      throw ServerException();
    }
  }
}
