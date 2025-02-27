import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class HaveOrNotHaveAccount extends StatelessWidget {
  const HaveOrNotHaveAccount({super.key, this.onTap, required this.isSignIn});

  final void Function()? onTap;
  final bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isSignIn ? AppStrings.dontHaveAccount : AppStrings.alreadyHaveAccount,
          style: StyleManager.textStyle16(
            context,
            FontWeight.w600,
          ).copyWith(color: AppColor.gray),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            isSignIn ? AppStrings.createAccount : AppStrings.signIn,
            style: StyleManager.textStyle16(
              context,
              FontWeight.w600,
            ).copyWith(color: AppColor.darkPrimary),
          ),
        ),
      ],
    );
  }
}
