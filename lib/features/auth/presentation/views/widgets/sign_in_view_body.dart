import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_snack_bar.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';
import 'package:fruits_hub/features/auth/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/components/or_divider.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_auth_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          customSnackBar(
            context: context,
            message: state.message,
            backgroundColor: AppColor.darkPrimary,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColor.darkPrimary,
            ),
          );
        } else if (state is SignInSuccessState) {
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   Routes.homeScreen,
          //   (route) => false,
          // );
        }
      },
      builder: (context, state) {
        final signInCubit = SignInCubit.get(context);
        return CustomScrollView(
          physics: ClampingScrollPhysics(), // منع التمرير المرن على iOS
          slivers: [
            SliverPadding(
              padding: PaddingManager.symmetric(context: context, vertical: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    key: signInCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextFormField(
                          controller: signInCubit.emailController,
                          validator: ValidationManager.validateEmail,
                          hintText: AppStrings.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBoxManager.height(context, 16),

                        /// Password Validation Widget
                        ValueListenableBuilder(
                          valueListenable: signInCubit.isPasswordVisible,
                          builder: (context, isVisible, child) {
                            return CustomTextFormField(
                              obscureText: isVisible,
                              controller: signInCubit.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.passwordIsRequired;
                                }
                                return null;
                              },
                              hintText: AppStrings.password,
                              keyboardType: TextInputType.visiblePassword,
                              suffixIconWidget: IconButton(
                                onPressed: () {
                                  signInCubit.isPasswordVisible.value =
                                      !signInCubit.isPasswordVisible.value;
                                },
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColor.stoneLight,
                                ),
                              ),
                            );
                          },
                        ),

                        SizedBoxManager.height(context, 16),
                        Text(
                          textAlign: TextAlign.left,
                          AppStrings.forgotPassword,
                          style: StyleManager.textStyle14(
                            context,
                            FontWeight.w600,
                          ).copyWith(color: AppColor.lightPrimary),
                        ),
                        SizedBoxManager.height(context, 33),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      if (signInCubit.formKey.currentState!.validate()) {
                        signInCubit.signIn();
                      }
                    },
                    isLoading: state is SignInLoadingState,
                    text: AppStrings.signIn,
                  ),
                  SizedBoxManager.height(context, 33),
                  HaveOrNotHaveAccount(
                    isSignIn: true,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.signUpScreen);
                    },
                  ),
                  SizedBoxManager.height(context, 33),
                  const ORDivider(),
                  SocialAuthButton(
                    title: AppStrings.signInWithGoogle,
                    iconPath: IconsAssets.googleIcon,
                    onPressed: () {},
                  ),
                  SocialAuthButton(
                    title: AppStrings.signInWithApple,
                    iconPath: IconsAssets.appleIcon,
                    onPressed: () {},
                  ),
                  SocialAuthButton(
                    title: AppStrings.signInWithFacebook,
                    iconPath: IconsAssets.facebookIcon,
                    onPressed: () {},
                  ),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
