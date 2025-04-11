import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: StyleManager.textStyle14(
          context,
          FontWeight.bold,
        ).copyWith(color: AppColor.white),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
