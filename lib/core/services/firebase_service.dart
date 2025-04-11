import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuth.createUserWithEmailAndPassword: ${e.code}",
      );
      switch (e.code) {
        case 'invalid-email':
          throw ValidationException(message: 'البريد الإلكتروني غير صالح.');

        case 'user-disabled':
          throw AuthException(message: 'تم تعطيل هذا الحساب.');

        case 'user-not-found':
          throw AuthException(message: 'لا يوجد حساب مرتبط بهذا البريد.');

        case 'wrong-password':
          throw AuthException(message: 'كلمة المرور غير صحيحة.');

        case 'email-already-in-use':
          throw ValidationException(
            message: 'البريد الإلكتروني مستخدم بالفعل.',
          );

        case 'operation-not-allowed':
          throw AuthException(
            message: 'عملية تسجيل الدخول غير مسموح بها حالياً.',
          );

        case 'weak-password':
          throw ValidationException(message: 'كلمة المرور ضعيفة جدًا.');

        case 'too-many-requests':
          throw NetworkException(
            message: 'طلبات كثيرة جدًا. برجاء المحاولة لاحقًا.',
          );

        case 'network-request-failed':
          throw NetworkException();

        default:
          throw CustomException(message: 'في مشكلة حصلت جرب كمان شويه');
      }
    } catch (e) {
      throw CustomException(message: "في مشكلة حصلت جرب كمان شويه");
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuth.signInWithEmailAndPassword: ${e.code}");
      switch (e.code) {
        case 'invalid-email':
          throw ValidationException(message: 'البريد الإلكتروني غير صالح.');

        case 'user-disabled':
          throw AuthException(message: 'تم تعطيل هذا الحساب.');

        case 'user-not-found':
          throw AuthException(message: 'لا يوجد حساب مرتبط بهذا البريد.');

        case 'wrong-password':
          throw AuthException(message: 'كلمة المرور غير صحيحة.');

        case 'email-already-in-use':
          throw ValidationException(
            message: 'البريد الإلكتروني مستخدم بالفعل.',
          );

        case 'operation-not-allowed':
          throw AuthException(
            message: 'عملية تسجيل الدخول غير مسموح بها حالياً.',
          );

        case 'weak-password':
          throw ValidationException(message: 'كلمة المرور ضعيفة جدًا.');

        case 'too-many-requests':
          throw NetworkException(
            message: 'طلبات كثيرة جدًا. برجاء المحاولة لاحقًا.',
          );

        case 'network-request-failed':
          throw NetworkException();

        default:
          throw CustomException(message: 'في مشكلة حصلت جرب كمان شويه');
      }
    } catch (e) {
      log("Exception in FirebaseAuth.signInWithEmailAndPassword: $e");
      throw CustomException(message: "في مشكلة حصلت جرب كمان شويه");
    } finally {
      if (FirebaseAuth.instance.currentUser != null) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return user;
        } else {
          throw CustomException(message: "في مشكلة حصلت جرب كمان شويه");
        }
      }
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
