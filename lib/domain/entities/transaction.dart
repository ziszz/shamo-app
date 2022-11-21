import 'package:equatable/equatable.dart';
import 'package:shamo_app/domain/entities/transaction_item.dart';

class Transaction extends Equatable {
  final int id;
  final int usersId;
  final String address;
  final double totalPrice;
  final double shippingPrice;
  final String status;
  final String payment;
  final List<TransactionItem> items;
  final String createdAt;
  final String updatedAt;

  const Transaction({
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
