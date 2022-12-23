import 'package:equatable/equatable.dart';
import 'package:product/data/models/category_model.dart';
import 'package:product/data/models/gallery_model.dart';
import 'package:product/domain/entities/product.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final double price;
  final String description;
  final String? tags;
  final CategoryModel? category;
  final List<GalleryModel>? galleries;
  final String createdAt;
  final String updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    this.category,
    required this.galleries,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        description: json["description"],
        tags: json["tags"],
        category: json["category"] != null
            ? CategoryModel.fromJson(json["category"])
            : null,
        galleries: json["galleries"] != null
            ? List<GalleryModel>.from(
                (json["galleries"] as List)
                    .map((e) => GalleryModel.fromJson(e)),
              )
            : [],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "tags": tags,
        "category": category?.toJson(),
        "galleries": galleries?.map((e) => e.toJson()).toList(),
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Product toEntity() => Product(
        id: id,
        name: name,
        price: price,
        description: description,
        tags: tags ?? "",
        category: category?.toEntity(),
        galleries: galleries?.map((e) => e.toEntity()).toList() ?? [],
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        description,
        tags,
        category,
        galleries,
        createdAt,
        updatedAt,
      ];
}
