import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading:
        title == AppStrings.signIn
            ? null
            : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
    title: Text(
      title,
      style: StyleManager.textStyle20(context, FontWeight.bold),
    ),
  );
}
