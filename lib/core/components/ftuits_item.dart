import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  // Map<String, String> bestSellerItem ={
  //   'name': 'Banana',
  //   'price': '\$1.00',
  //   'image': ImagesAssets.bestSeller1,
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImagesAssets.featuredItem3),
        const SizedBox(height: 8),
        Text(
          AppStrings.watermelon,
          style: StyleManager.textStyle14(
            context,
            FontWeight.bold,
          ).copyWith(color: AppColor.back),
        ),
        SizedBoxManager.height(context, 4),
        Row(
          children: [
            Text(
              "20 ${AppStrings.lE}",
              style: StyleManager.textStyle14(
                context,
                FontWeight.bold,
              ).copyWith(color: AppColor.secondary),
            ),

            Text(
              AppStrings.measurement,
              style: StyleManager.textStyle14(
                context,
                FontWeight.w400,
              ).copyWith(color: AppColor.secondary.withOpacity(.8)),
            ),
          ],
        ),
      ],
    );
  }
}
