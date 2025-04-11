import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.createUser: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebase(user!));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithGoogle: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebase(user));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithFacebook: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }
}
