import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_app_bar.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.signIn),
      body: SignInViewBody(),
    );
  }
}
