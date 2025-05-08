import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.symmetric(context: context, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.white,
            suffixIcon: SizedBox(
              width: SizeManager.getSize(context).width * 0.05,
              child: Center(child: SvgPicture.asset(IconsAssets.filter)),
            ),

            prefixIcon: SizedBox(
              width: SizeManager.getSize(context).width * 0.05,
              child: Center(child: SvgPicture.asset(IconsAssets.search)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: AppStrings.searchFor,
            hintStyle: StyleManager.textStyle14(context),
          ),
        ),
      ),
    );
  }
}
