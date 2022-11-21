import 'package:equatable/equatable.dart';
import 'package:shamo_app/data/models/gallery_model.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final String description;
  final String tags;
  final int categoriesId;
  final List<GalleryModel> galleries;
  final String createdAt;
  final String updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.categoriesId,
    required this.galleries,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        description,
        tags,
        categoriesId,
        galleries,
        createdAt,
        updatedAt,
      ];
}
