import 'package:equatable/equatable.dart';
import 'package:shamo_app/domain/entities/user.dart';

class UserModel extends Equatable {
  final int id;
  final String? token;
  final String name;
  final String email;
  final String username;
  final String roles;
  final String profilePhotoUrl;
  final String createdAt;
  final String updatedAt;

  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["user"]["id"],
        token: json["access_token"] ?? "",
        name: json["user"]["name"],
        email: json["user"]["email"],
        username: json["user"]["username"],
        roles: json["user"]["roles"],
        profilePhotoUrl: json["user"]["profile_photo_url"],
        createdAt: json["user"]["created_at"],
        updatedAt: json["user"]["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": token ?? "",
        "user": {
          "id": id,
          "name": name,
          "email": email,
          "username": username,
          "roles": roles,
          "profile_photo_url": profilePhotoUrl,
          "created_at": createdAt,
          "updated_at": updatedAt,
        },
      };

  User toEntity() => User(
        id: id,
        token: token,
        name: name,
        email: email,
        username: username,
        roles: roles,
        profilePhotoUrl: profilePhotoUrl,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

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
