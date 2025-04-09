import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeManager.getSize(context).width,
      height: SizeManager.getSize(context).height * 0.065,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusManager.medium(context),
          ),
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(color: AppColor.white)
                : Text(
                  text,
                  style: StyleManager.textStyle16(
                    context,
                    FontWeight.w700,
                  ).copyWith(color: AppColor.white),
                ),
      ),
    );
  }
}
