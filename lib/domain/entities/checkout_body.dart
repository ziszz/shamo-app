import 'package:equatable/equatable.dart';
import 'package:shamo_app/domain/entities/checkout_item.dart';

class CheckoutBody extends Equatable {
  final String address;
  final List<CheckoutItem> items;
  final String status;
  final double totalPrice;
  final double shippingPrice;

  const CheckoutBody({
    required this.address,
    required this.items,
    required this.status,
    required this.totalPrice,
    required this.shippingPrice,
  });

  @override
  List<Object?> get props => [
        address,
        items,
        status,
        totalPrice,
        shippingPrice,
      ];
}
