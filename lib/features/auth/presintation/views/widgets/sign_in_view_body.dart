import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/features/auth/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/components/or_divider.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingManager.symmetric(context: context, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
              AppStrings.forgotPassword,
              style: StyleManager.textStyle14(
                context,
                FontWeight.w600,
              ).copyWith(color: AppColor.lightPrimary),
            ),
            SizedBoxManager.height(context, 33),
            CustomButton(onPressed: () {}, text: AppStrings.signIn),
            SizedBoxManager.height(context, 33),
            HaveOrNotHaveAccount(isSignIn: false, onTap: () {}),
            SizedBoxManager.height(context, 33),
            const ORDivider(),
            SizedBox(
              // height: 56,
              height: SizedBoxManager.responsiveSize(context, 100),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.silverSky,

                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusManager.medium(context),
                  ),
                  side: BorderSide(color: AppColor.darkSilverSky, width: 1),
                ),
                onPressed: () {},
                child: ListTile(
                  visualDensity: VisualDensity(
                    vertical: VisualDensity.minimumDensity,
                  ),
                  leading: SvgPicture.asset(IconsAssets.googleIcon, width: 24),
                  title: Text(
                    AppStrings.signInWithGoogle,
                    style: StyleManager.textStyle16(context, FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
