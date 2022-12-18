import 'package:equatable/equatable.dart';
import 'package:product/domain/entities/product.dart';

class TransactionItem extends Equatable {
  final int id;
  final int usersId;
  final int productsId;
  final int transactionsId;
  final int quantity;
  final Product product;
  final String createdAt;
  final String updatedAt;

  const TransactionItem({
    required this.id,
    required this.usersId,
    required this.productsId,
    required this.transactionsId,
    required this.quantity,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        usersId,
        productsId,
        transactionsId,
        quantity,
        createdAt,
        updatedAt,
      ];
}
