import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/features/auth/components/have_or_not_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presintation/views/widgets/terms_condition_widget.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              CustomTextFormField(hintText: AppStrings.fullName),
              SizedBoxManager.height(context, 16),
              CustomTextFormField(hintText: AppStrings.email),
              SizedBoxManager.height(context, 16),
              CustomTextFormField(hintText: AppStrings.password),
              SizedBoxManager.height(context, 16),
              TermsAndConditionsWidget(),
              SizedBoxManager.height(context, 30),
              CustomButton(onPressed: () {}, text: AppStrings.createAccount),
              SizedBoxManager.height(context, 30),
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
