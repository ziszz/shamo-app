import 'package:dartz/dartz.dart';
import 'package:shamo_app/data/datasources/product_remote_data_source.dart';
import 'package:shamo_app/domain/entities/product.dart';
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
}
