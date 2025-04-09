import 'package:fruits_hub/core/helper/fire_base_string.dart';

class UserEntity {
  final String name;
  final String email;
  final String password;
  final String userId;

  UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.userId,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json[FirebaseString.name] as String,
      email: json[FirebaseString.email] as String,
      password: json[FirebaseString.password] as String,
      userId: json[FirebaseString.userId] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {FirebaseString.userId: userId, FirebaseString.email: email};
  }
}
