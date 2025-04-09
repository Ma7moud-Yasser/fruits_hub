import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sin_up_state.dart';

class SinUpCubit extends Cubit<SinUpState> {
  SinUpCubit(this.authRepo) : super(SinUpInitialState());
  final AuthRepo authRepo;

  Future<void> signUp(String email, String password, String name) async {
    emit(SinUpLoadingState());
    final result = await authRepo.createUser(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (Failure) => emit(SinUpErrorState(message: Failure.message)),
      (UserEntity) => emit(SinUpSuccessState(userEntity: UserEntity)),
    );
  }
}
