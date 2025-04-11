part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final UserEntity userEntity;
  SignInSuccessState(this.userEntity);
}

final class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState(this.message);
}
