import 'package:dartz/dartz.dart';
import 'package:shamo_app/domain/entities/product.dart';
import 'package:shamo_app/utilities/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
