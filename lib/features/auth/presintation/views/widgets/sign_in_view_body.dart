import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/features/auth/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/components/or_divider.dart';
import 'package:fruits_hub/features/auth/presintation/views/widgets/social_auth_button.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(), // منع التمرير المرن على iOS
      slivers: [
        SliverPadding(
          padding: PaddingManager.symmetric(context: context, vertical: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              CustomTextFormField(
                hintText: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBoxManager.height(context, 16),
              CustomTextFormField(
                hintText: AppStrings.password,
                keyboardType: TextInputType.visiblePassword,
                suffixIconWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility, color: AppColor.stoneLight),
                ),
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
              CustomButton(onPressed: () {}, text: AppStrings.signIn),
              SizedBoxManager.height(context, 33),
              HaveOrNotHaveAccount(isSignIn: true, onTap: () {}),
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
  }
}
