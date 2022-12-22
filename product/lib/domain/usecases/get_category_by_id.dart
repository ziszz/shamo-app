import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/repositories/product_repository.dart';

class GetCategoryById {
  final ProductRepository _repository;

  const GetCategoryById(this._repository);

  Future<Either<Failure, Category>> execute(int categoryId) =>
      _repository.getProductCategoryById(categoryId);
}
