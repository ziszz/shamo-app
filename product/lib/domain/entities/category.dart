import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
