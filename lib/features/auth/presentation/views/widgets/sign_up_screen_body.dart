import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/features/auth/presentation/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/build_form.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/build_sign_up_button.dart';
import 'package:fruits_hub/features/auth/signUpCubit/sin_up_cubit.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  @override
  Widget build(BuildContext context) {
    final signUpCubit = SignUpCubit.get(context);

    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildForm(context, signUpCubit)),
          SliverToBoxAdapter(child: BuildSignUpButton(cubit: signUpCubit)),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBoxManager.height(context, 26),
              HaveOrNotHaveAccount(
                isSignIn: false,
                onTap: () => Navigator.pop(context),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
