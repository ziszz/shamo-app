import 'package:equatable/equatable.dart';
import 'package:shamo_app/domain/entities/category.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  Category toEntity() => Category(
        id: id,
        name: name,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
