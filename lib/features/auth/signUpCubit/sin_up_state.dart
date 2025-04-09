part of 'sin_up_cubit.dart';

@immutable
sealed class SinUpState {}

final class SinUpInitialState extends SinUpState {}

final class SinUpLoadingState extends SinUpState {}

final class SinUpSuccessState extends SinUpState {
  final UserEntity userEntity;
  SinUpSuccessState({required this.userEntity});
}

final class SinUpErrorState extends SinUpState {
  final String message;
  SinUpErrorState({required this.message});
}
