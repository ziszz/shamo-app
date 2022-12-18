import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String? token;
  final String name;
  final String email;
  final String username;
  final String roles;
  final String profilePhotoUrl;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    required this.username,
    required this.roles,
    required this.profilePhotoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        token,
        name,
        email,
        username,
        roles,
        profilePhotoUrl,
        createdAt,
        updatedAt,
      ];
}
