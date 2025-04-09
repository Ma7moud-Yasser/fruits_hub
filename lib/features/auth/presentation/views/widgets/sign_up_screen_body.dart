import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';
import 'package:fruits_hub/features/auth/presentation/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/PasswordValidationWidget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_condition_widget.dart';
import 'package:fruits_hub/features/auth/signUpCubit/sin_up_cubit.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final signUpCubit = SignUpCubit.get(context);
    final checklist = ValidationManager.validatePasswordChecklist(
      signUpCubit.passwordController.text,
    );

    bool allConditionsMet = checklist.values.every((isValid) => isValid);

    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: signUpCubit.nameController,
                    hintText: AppStrings.fullName,

                    validator: (value) => ValidationManager.validateName(value),
                  ),
                  SizedBoxManager.height(context, 16),
                  CustomTextFormField(
                    controller: signUpCubit.emailController,
                    hintText: AppStrings.email,

                    validator:
                        (value) => ValidationManager.validateEmail(value),
                  ),
                  SizedBoxManager.height(context, 16),
                  PasswordValidationWidget(
                    allConditionsMet: allConditionsMet,
                    isPasswordVisible: signUpCubit.isPasswordVisible,
                    passwordController: signUpCubit.passwordController,
                  ),
                  SizedBoxManager.height(context, 16),
                  TermsAndConditionsWidget(),
                  SizedBoxManager.height(context, 30),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                        style: StyleManager.textStyle14(
                          context,
                          FontWeight.bold,
                        ).copyWith(color: AppColor.white),
                      ),
                      backgroundColor: AppColor.darkPrimary,
                    ),
                  );
                } else if (state is SignUpSuccessState) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                final signUpCubit = SignUpCubit.get(context);
                return CustomButton(
                  isLoading: state is SignUpLoadingState,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signUpCubit.signUp();
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: AppStrings.createAccount,
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBoxManager.height(context, 26),
              HaveOrNotHaveAccount(
                isSignIn: false,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
