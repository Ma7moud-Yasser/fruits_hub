import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_snack_bar.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/sin_up_cubit.dart';

class BuildSignUpButton extends StatefulWidget {
  final SignUpCubit cubit;
  const BuildSignUpButton({super.key, required this.cubit});

  @override
  State<BuildSignUpButton> createState() => _BuildSignUpButtonState();
}

class _BuildSignUpButtonState extends State<BuildSignUpButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          customSnackBar(
            context: context,
            message: state.message,
            backgroundColor: AppColor.darkPrimary,
          );
        } else if (state is SignUpSuccessState) {
          customSnackBar(
            context: context,
            message: AppStrings.accountCreatedSuccessfully,
            backgroundColor: AppColor.darkPrimary,
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is SignUpLoadingState,
          onPressed: () {
            if (widget.cubit.formKey.currentState!.validate()) {
              if (!widget.cubit.isTermsAccepted.value) {
                customSnackBar(
                  context: context,
                  message: AppStrings.pleaseAcceptTerms,
                  backgroundColor: AppColor.darkPrimary,
                );
              } else {
                widget.cubit.formKey.currentState!.save();
                widget.cubit.signUp();
              }
            }
          },
          text: AppStrings.createAccount,
        );
      },
    );
  }
}
