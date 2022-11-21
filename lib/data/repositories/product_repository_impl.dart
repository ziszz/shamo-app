import 'package:dartz/dartz.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/data/models/checkout_body_model.dart';
import 'package:shamo_app/domain/entities/category.dart';
import 'package:shamo_app/domain/entities/checkout_body.dart';
import 'package:shamo_app/domain/entities/product.dart';
import 'package:shamo_app/domain/entities/transaction.dart';
import 'package:shamo_app/domain/repositories/product_repository.dart';
import 'package:shamo_app/utilities/exceptions.dart';
import 'package:shamo_app/utilities/failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  const ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await remoteDataSource.getProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getProductCategories() async {
    try {
      final result = await remoteDataSource.getProductCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions(
      int idUser, String token) async {
    try {
      final result = await remoteDataSource.getTransactions(idUser, token);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, String>> checkout(
      String token, CheckoutBody checkoutData) async {
    final result = await remoteDataSource.checkout(
        token, CheckoutBodyModel.fromEntity(checkoutData));
    return Right(result);
  }
}
