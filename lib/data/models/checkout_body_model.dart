import 'package:equatable/equatable.dart';

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

  Map<String, dynamic> toJson() => {
        "address": address,
        "items": items.map((e) => e.toJson()),
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
