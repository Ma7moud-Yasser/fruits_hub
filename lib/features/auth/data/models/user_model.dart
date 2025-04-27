import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.userId});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
      userId: user.uid,
    );
  }
}
