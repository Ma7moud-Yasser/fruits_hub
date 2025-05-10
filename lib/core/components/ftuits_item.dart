import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 250,
      decoration: BoxDecoration(
        color: AppColor.important,
        borderRadius: BorderRadiusManager.small(context),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBoxManager.height(context, 20),
                Image.asset(ImagesAssets.bestSeller2),
                SizedBoxManager.height(context, 24),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppStrings.watermelon,
                    style: StyleManager.textStyle14(
                      context,
                      FontWeight.bold,
                    ).copyWith(color: AppColor.back),
                  ),
                  subtitle: Text.rich(
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    TextSpan(
                      text: "20",
                      style: StyleManager.textStyle14(
                        context,
                        FontWeight.bold,
                      ).copyWith(color: AppColor.secondary),
                      children: [
                        TextSpan(
                          text: " ${AppStrings.lE}",
                          style: StyleManager.textStyle14(
                            context,
                            FontWeight.bold,
                          ).copyWith(color: AppColor.secondary),
                        ),
                        TextSpan(
                          text: AppStrings.measurement,
                          style: StyleManager.textStyle14(
                            context,
                            FontWeight.normal,
                          ).copyWith(
                            color: AppColor.secondary.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColor.primary,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
