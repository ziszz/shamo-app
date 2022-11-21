import 'package:equatable/equatable.dart';
import 'package:shamo_app/data/models/transaction_item_model.dart';
import 'package:shamo_app/domain/entities/transaction.dart';

class TransactionModel extends Equatable {
  final int id;
  final int usersId;
  final String address;
  final double totalPrice;
  final double shippingPrice;
  final String status;
  final String payment;
  final List<TransactionItemModel> items;
  final String createdAt;
  final String updatedAt;

  const TransactionModel({
    required this.id,
    required this.usersId,
    required this.address,
    required this.totalPrice,
    required this.shippingPrice,
    required this.status,
    required this.payment,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        usersId: json["users_id"],
        address: json["address"],
        totalPrice: json["total_price"].toDouble(),
        shippingPrice: json["shipping_price"].toDouble(),
        status: json["status"],
        payment: json["payment"],
        items: List<TransactionItemModel>.from(
          (json["items"] as List).map((e) => TransactionItemModel.fromJson(e)),
        ),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'users_id': usersId,
        'address': address,
        'total_price': totalPrice,
        'shipping_price': shippingPrice,
        'status': status,
        'payment': payment,
        'items': items.map((e) => e.toJson()),
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Transaction toEntity() => Transaction(
        id: id,
        usersId: usersId,
        address: address,
        totalPrice: totalPrice,
        shippingPrice: shippingPrice,
        status: status,
        payment: payment,
        items: items.map((e) => e.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        usersId,
        address,
        totalPrice,
        shippingPrice,
        status,
        payment,
        items,
        createdAt,
        updatedAt,
      ];
}
