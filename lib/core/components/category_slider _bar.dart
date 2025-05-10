import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CategorySliderBar extends StatelessWidget {
  const CategorySliderBar({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: StyleManager.textStyle18(context, FontWeight.bold),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              AppStrings.more,
              style: StyleManager.textStyle14(context, FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
