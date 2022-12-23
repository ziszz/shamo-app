import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/entities/checkout_body.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/domain/entities/transaction.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<Product>>> getProductsByCategory(int categoryId);
  Future<Either<Failure, List<Category>>> getProductCategories();
  Future<Either<Failure, List<Transaction>>> getTransactions(String token);
  Future<Either<Failure, String>> checkout(
      String token, CheckoutBody checkoutData);
}
