import 'package:core/utilities/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/product.dart';
import 'package:product/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository _repository;

  const GetProductsByCategory(this._repository);

  Future<Either<Failure, List<Product>>> execute(int categoryId) =>
      _repository.getProductsByCategory(categoryId);
}
