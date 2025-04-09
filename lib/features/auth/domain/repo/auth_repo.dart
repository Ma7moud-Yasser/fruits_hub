import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
