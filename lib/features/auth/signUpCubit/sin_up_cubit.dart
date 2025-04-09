import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sin_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    final result = await authRepo.createUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );

    result.fold(
      (failure) => emit(SignUpErrorState(message: failure.message)),
      (userEntity) => emit(SignUpSuccessState(userEntity: userEntity)),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
