import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeManager.getSize(context).width,
      height: SizeManager.getSize(context).height * 0.06,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusManager.medium(context),
          ),
        ),
        child: Text(
          text,
          style: StyleManager.textStyle16(
            context,
          ).copyWith(color: AppColor.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
