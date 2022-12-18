import 'package:equatable/equatable.dart';
import 'package:product/domain/entities/gallery.dart';

class GalleryModel extends Equatable {
  final int id;
  final int productsId;
  final String url;
  final String createdAt;
  final String updatedAt;

  const GalleryModel({
    required this.id,
    required this.productsId,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json["id"],
        productsId: json['products_id'],
        url: json["url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'products_id': productsId,
        "url": url,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Gallery toEntity() => Gallery(
        id: id,
        productsId: productsId,
        url: url,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, url, productsId, createdAt, updatedAt];
}
