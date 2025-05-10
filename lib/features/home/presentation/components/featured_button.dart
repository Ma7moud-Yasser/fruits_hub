import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

// ignore: must_be_immutable
class FeaturedButton extends StatelessWidget {
  FeaturedButton({
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
      height: SizeManager.getSize(context).height * .05,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusManager.small(context),
          ),
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(color: AppColor.primary)
                : Padding(
                  padding: PaddingManager.symmetric(
                    context: context,
                    horizontal: 28,
                    vertical: 0,
                  ),
                  child: FittedBox(
                    child: Text(
                      text,
                      style: StyleManager.textStyle16(
                        context,
                        FontWeight.bold,
                      ).copyWith(color: AppColor.darkPrimary),
                    ),
                  ),
                ),
      ),
    );
  }
}
