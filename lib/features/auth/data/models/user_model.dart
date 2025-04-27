import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
    required super.userId,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      password: 'No Password', // Password is not retrievable from Firebase
      userId: user.uid,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? 'No Name',
      email: json["email"] ?? 'No Email',
      password: 'No Password',
      userId: json["userId"],
    );
  }
}
