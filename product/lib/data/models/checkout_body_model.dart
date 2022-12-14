import 'package:equatable/equatable.dart';
import 'package:product/domain/entities/checkout_body.dart';
import 'package:product/domain/entities/checkout_item.dart';

class CheckoutBodyModel extends Equatable {
  final String address;
  final List<CheckoutItemModel> items;
  final String status;
  final double totalPrice;
  final double shippingPrice;

  const CheckoutBodyModel({
    required this.address,
    required this.items,
    required this.status,
    required this.totalPrice,
    required this.shippingPrice,
  });

  factory CheckoutBodyModel.fromEntity(CheckoutBody checkoutBody) =>
      CheckoutBodyModel(
        address: checkoutBody.address,
        items: checkoutBody.items
            .map((e) => CheckoutItemModel.fromEntity(e))
            .toList(),
        status: checkoutBody.status,
        totalPrice: checkoutBody.totalPrice,
        shippingPrice: checkoutBody.shippingPrice,
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "items": items.map((e) => e.toJson()).toList(),
        "status": status,
        "total_price": totalPrice,
        "shipping_price": shippingPrice,
      };

  @override
  List<Object?> get props => [
        address,
        items,
        status,
        totalPrice,
        shippingPrice,
      ];
}

class CheckoutItemModel extends Equatable {
  final int id;
  final int quantity;

  const CheckoutItemModel({
    required this.id,
    required this.quantity,
  });

  factory CheckoutItemModel.fromEntity(CheckoutItem checkoutItem) =>
      CheckoutItemModel(
        id: checkoutItem.id,
        quantity: checkoutItem.quantity,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
      };

  @override
  List<Object?> get props => [
        id,
        quantity,
      ];
}
