import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/domain/entities/checkout_body.dart';
import 'package:product/domain/repositories/product_repository.dart';

class Checkout {
  final ProductRepository _repository;

  const Checkout(this._repository);

  Future<Either<Failure, String>> execute(
          String token, CheckoutBody checkoutData) =>
      _repository.checkout(token, checkoutData);
}
