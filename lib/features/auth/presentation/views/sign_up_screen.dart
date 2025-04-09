import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/components/custom_app_bar.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/services/get_it.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:fruits_hub/features/auth/signUpCubit/sin_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: AppStrings.signUp),
        body: SignUpScreenBody(),
      ),
    );
  }
}
