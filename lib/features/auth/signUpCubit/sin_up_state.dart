part of 'sin_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccessState({required this.userEntity});
}

final class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState({required this.message});
}
