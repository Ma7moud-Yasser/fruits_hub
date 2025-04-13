import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/components/custom_app_bar.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/services/get_it.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, title: AppStrings.signIn),
        body: SignInViewBody(),
      ),
    );
  }
}
