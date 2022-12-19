import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/transaction.dart';
import 'package:product/domain/repositories/product_repository.dart';

class GetTransactions {
  final ProductRepository _repository;

  const GetTransactions(this._repository);

  Future<Either<Failure, List<Transaction>>> execute(
          int userId, String token) =>
      _repository.getTransactions(userId, token);
}
