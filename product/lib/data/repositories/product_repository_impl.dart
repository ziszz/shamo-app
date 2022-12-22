import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/data/datasources/product_remote_data_source.dart';
import 'package:product/data/models/checkout_body_model.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/entities/checkout_body.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/domain/entities/transaction.dart';
import 'package:product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  const ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final result = await _remoteDataSource.getProducts();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getProductCategories() async {
    try {
      final result = await _remoteDataSource.getProductCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions(
      int idUser, String token) async {
    try {
      final result = await _remoteDataSource.getTransactions(idUser, token);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, String>> checkout(
      String token, CheckoutBody checkoutData) async {
    try {
      final result = await _remoteDataSource.checkout(
          token, CheckoutBodyModel.fromEntity(checkoutData));
      return Right(result.status);
    } on ServerException {
      return const Left(ServerFailure(Constants.checkoutFailedMessage));
    }
  }
}
