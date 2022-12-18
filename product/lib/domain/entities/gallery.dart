import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final int id;
  final int productsId;
  final String url;
  final String createdAt;
  final String updatedAt;

  const Gallery({
    required this.id,
    required this.productsId,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, url, productsId, createdAt, updatedAt];
}
