import 'package:equatable/equatable.dart';
import 'package:shamo_app/data/models/user_model.dart';
import 'package:shamo_app/domain/entities/user.dart';

class UserResponse extends Equatable {
  final String token;
  final UserModel user;

  const UserResponse({
    required this.token,
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        token: json["access_token"] ?? "",
        user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": token,
        "user": user.toJson(),
      };

  User toEntity() => User(
        id: user.id,
        token: token,
        name: user.name,
        email: user.email,
        username: user.username,
        roles: user.roles,
        profilePhotoUrl: user.profilePhotoUrl,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
      );

  @override
  List<Object?> get props => [token, user];
}
