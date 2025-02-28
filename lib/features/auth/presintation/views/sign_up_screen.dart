import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_app_bar.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/features/auth/presintation/views/widgets/sign_up_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.signUp),
      body: SignUpScreenBody(),
    );
  }
}
