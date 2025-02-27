import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColor.gray, thickness: 1, height: 1)),
        Padding(
          padding: PaddingManager.symmetric(
            context: context,
            horizontal: 18,
            vertical: 5,
          ),
          child: Text(
            AppStrings.or,
            style: StyleManager.textStyle16(context, FontWeight.w600),
          ),
        ),
        Expanded(child: Divider(color: AppColor.gray, thickness: 1, height: 1)),
      ],
    );
  }
}
