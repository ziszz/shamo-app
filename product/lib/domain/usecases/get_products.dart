import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository _repository;

  const GetProducts(this._repository);

  Future<Either<Failure, List<Product>>> execute() => _repository.getProducts();
}
