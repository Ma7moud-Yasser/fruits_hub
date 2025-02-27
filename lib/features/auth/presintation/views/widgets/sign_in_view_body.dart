import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

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
          ],
        ),
      ),
    );
  }
}
