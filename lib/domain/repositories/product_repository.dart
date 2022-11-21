import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/category.dart';
import 'package:shamo_app/domain/entities/product.dart';
import 'package:shamo_app/domain/entities/transaction.dart';
import 'package:shamo_app/utilities/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, List<Category>>> getProductCategories();
  Future<Either<Failure, List<Transaction>>> getTransactions(
      int idUser, String token);
}
