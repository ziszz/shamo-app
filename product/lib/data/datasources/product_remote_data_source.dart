import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/io_client.dart';
import 'package:product/data/models/category_model.dart';
import 'package:product/data/models/category_response.dart';
import 'package:product/data/models/checkout_body_model.dart';
import 'package:product/data/models/checkout_response.dart';
import 'package:product/data/models/product_model.dart';
import 'package:product/data/models/product_response.dart';
import 'package:product/data/models/transaction_model.dart';
import 'package:product/data/models/transaction_response.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
  Future<List<CategoryModel>> getProductCategories();
  Future<List<TransactionModel>> getTransactions(int idUser, String token);
  Future<CheckoutResponse> checkout(
      String token, CheckoutBodyModel checkoutData);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final IOClient _client;

  const ProductRemoteDataSourceImpl(this._client);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response =
        await _client.get(Uri.parse("${dotenv.env["apiUrl"]}/api/products"));

    if (response.statusCode == 200) {
      final result =
          ProductResponse.fromJson(jsonDecode(response.body)).productList;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final response = await _client.get(Uri.parse(
        "${dotenv.env["apiUrl"]}/api/products?categories=$categoryId"));
    if (response.statusCode == 200) {
      final result =
          ProductResponse.fromJson(jsonDecode(response.body)).productList;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CategoryModel>> getProductCategories() async {
    final response =
        await _client.get(Uri.parse("${dotenv.env["apiUrl"]}/api/categories"));

    if (response.statusCode == 200) {
      final result =
          CategoryResponse.fromJson(jsonDecode(response.body)).catagoryList;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions(
      int idUser, String token) async {
    final headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await _client.get(
        Uri.parse("${dotenv.env["apiUrl"]}/api/transactions?id=$idUser"),
        headers: headers);

    if (response.statusCode == 200) {
      final result = TransactionResponse.fromJson(jsonDecode(response.body))
          .transactionList;
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutResponse> checkout(
      String token, CheckoutBodyModel checkoutData) async {
    final headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await _client.post(
        Uri.parse("${dotenv.env["apiUrl"]}/api/checkout"),
        body: checkoutData.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      final result =
          CheckoutResponse.fromJson(jsonDecode(response.body)["meta"]);
      return result;
    } else {
      throw ServerException();
    }
  }
}
