import 'package:equatable/equatable.dart';

class CheckoutItem extends Equatable {
  final int id;
  final int quantity;

  const CheckoutItem({
    required this.id,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        quantity,
      ];
}
