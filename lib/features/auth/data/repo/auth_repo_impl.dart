import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/dataBase/database_sevices.dart';
import 'package:fruits_hub/core/services/end_point.dart';
import 'package:fruits_hub/core/services/fireBase/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthService firebaseAuthService;
  DataBaseServices dataBaseServices;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseServices,
  });
  @override
  Future<Either<Failure, UserEntity>> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        userId: user.uid,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
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
      UserEntity userEntity = await getUserData(userId: user.uid);
      print("userData: ${userEntity.name}");
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithEmailAndPassword: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user!);
      var checkUserExist = await dataBaseServices.checkIfDocumentExists(
        path: EndPoint.getUserData,
        documentId: userEntity.userId,
      );
      if (checkUserExist) {
        await getUserData(userId: userEntity.userId);
        log("Get User Data: ${userEntity.name}");
      } else {
        await addUserData(user: userEntity);
        log("Add User Data: ${userEntity.name}");
      }
      return right(UserModel.fromFirebase(user));
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithGoogle: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      var checkUserExist = await dataBaseServices.checkIfDocumentExists(
        path: EndPoint.getUserData,
        documentId: userEntity.userId,
      );
      if (checkUserExist) {
        await getUserData(userId: userEntity.userId);
        log("Get User Data: ${userEntity.name}");
      } else {
        await addUserData(user: userEntity);
        log("Add User Data: ${userEntity.name}");
      }

      return right(UserModel.fromFirebase(user));
    } catch (e) {
      await deleteUser(user);
      log("Exception in AuthRepoImpl.signInWithFacebook: $e");
      return left(ServerFailure(message: "في مشكلة حصلت جرب كمان شويه"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseServices.addData(
      path: EndPoint.addUserData,
      data: user.toMap(),
      documentId: user.userId,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) await firebaseAuthService.deleteUser();
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await dataBaseServices.getData(
      path: EndPoint.getUserData,
      documentId: userId,
    );
    return UserModel.fromJson(userData);
  }
}
