// Model
import 'package:auth/data/model/user_model.dart';
import 'package:auth/domain/entities/user.dart';

const testUserResponseJson = {
  "access_token": "access_token",
  "user": {
    "id": 1,
    "name": "name",
    "email": "email",
    "username": "username",
    "roles": "roles",
    "created_at": "created_at",
    "updated_at": "updated_at",
    "profile_photo_url": "profile_photo_url"
  }
};

const testUserJson = {
  "id": 1,
  "name": "name",
  "email": "email",
  "username": "username",
  "roles": "roles",
  "created_at": "created_at",
  "updated_at": "updated_at",
  "profile_photo_url": "profile_photo_url"
};

const testUserModel = UserModel(
  id: 1,
  token: "access_token",
  name: "name",
  email: "email",
  username: "username",
  roles: "roles",
  profilePhotoUrl: "profile_photo_url",
  createdAt: "created_at",
  updatedAt: "updated_at",
);

// Entity
const testUser = User(
  id: 1,
  token: "access_token",
  name: "name",
  email: "email",
  username: "username",
  roles: "roles",
  profilePhotoUrl: "profile_photo_url",
  createdAt: "created_at",
  updatedAt: "updated_at",
);
