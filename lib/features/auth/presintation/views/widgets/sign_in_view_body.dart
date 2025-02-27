import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [CustomTextFormField(hintText: AppStrings.email)],
      ),
    );
  }
}
