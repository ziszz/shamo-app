import 'package:equatable/equatable.dart';

class CheckoutResponse extends Equatable {
  final int code;
  final String status;
  final String message;

  const CheckoutResponse({
    required this.code,
    required this.status,
    required this.message,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      CheckoutResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  @override
  List<Object?> get props => [
        code,
        status,
        message,
      ];
}
