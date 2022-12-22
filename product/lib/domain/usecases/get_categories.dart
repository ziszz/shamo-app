import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/repositories/product_repository.dart';

class GetCategories {
  final ProductRepository _repository;

  const GetCategories(this._repository);

  Future<Either<Failure, List<Category>>> execute() =>
      _repository.getProductCategories();
}
