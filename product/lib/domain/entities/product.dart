import 'package:equatable/equatable.dart';
import 'package:product/domain/entities/category.dart';
import 'package:product/domain/entities/gallery.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final String description;
  final String tags;
  final Category category;
  final List<Gallery> galleries;
  final String createdAt;
  final String updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
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
        category,
        galleries,
        createdAt,
        updatedAt,
      ];
}
