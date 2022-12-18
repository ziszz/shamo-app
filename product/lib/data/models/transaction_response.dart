import 'package:equatable/equatable.dart';
import 'package:product/data/models/transaction_model.dart';

class TransactionResponse extends Equatable {
  final List<TransactionModel> transactionList;

  const TransactionResponse({required this.transactionList});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        transactionList: List<TransactionModel>.from(
          (json["data"]["data"]).map((e) => TransactionModel.fromJson(e)),
        ),
      );

  @override
  List<Object?> get props => [transactionList];
}
