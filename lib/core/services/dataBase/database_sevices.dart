import 'package:fruits_hub/core/entities/user_entity.dart';

abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<UserEntity> getUserData({required String path, required String uid});
}
