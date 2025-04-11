import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUser({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
