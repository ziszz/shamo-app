import 'package:equatable/equatable.dart';
import 'package:shamo_app/data/models/product_model.dart';

class TransactionItemModel extends Equatable {
  final int id;
  final int usersId;
  final int productsId;
  final int transactionsId;
  final int quantity;
  final ProductModel product;
  final String createdAt;
  final String updatedAt;

  const TransactionItemModel({
    required this.id,
    required this.usersId,
    required this.productsId,
    required this.transactionsId,
    required this.quantity,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      TransactionItemModel(
        id: json["id"],
        usersId: json["users_id"],
        productsId: json["products_id"],
        transactionsId: json["transactions_id"],
        quantity: json["quantity"],
        product: ProductModel.fromJson(json["product"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "products_id": productsId,
        "transactions_id": transactionsId,
        "quantity": quantity,
        "product": product.toJson(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

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