import 'package:equatable/equatable.dart';
import 'package:shamo_app/data/models/product_model.dart';

class ProductResponse extends Equatable {
  final List<ProductModel> productList;

  const ProductResponse({required this.productList});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        productList: List<ProductModel>.from(
          (json["data"]["data"] as List).map((e) => ProductModel.fromJson(e)),
        ),
      );

  @override
  List<Object?> get props => [productList];
}
