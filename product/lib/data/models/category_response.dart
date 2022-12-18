import 'package:equatable/equatable.dart';
import 'package:product/data/models/category_model.dart';

class CategoryResponse extends Equatable {
  final List<CategoryModel> catagoryList;

  const CategoryResponse({required this.catagoryList});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        catagoryList: List<CategoryModel>.from(
          (json["data"]["data"]).map((e) => CategoryModel.fromJson(e)),
        ),
      );

  @override
  List<Object?> get props => [catagoryList];
}
