import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitialState());
  AuthRepo authRepo;
  static SignInCubit get(context) => BlocProvider.of(context);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(true);

  Future<void> signIn() async {
    emit(SignInLoadingState());
    final result = await authRepo.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(SignInErrorState(failure.message)),
      (userEntity) => emit(SignInSuccessState(userEntity)),
    );
  }
}
