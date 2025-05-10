import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/features/home/presentation/components/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return FeaturedItem(
            imagePath: ImagesAssets.featuredItem1,
            title: AppStrings.eidOffers,
            subTitle: AppStrings.offer25,
            buttonPressed: () {},
          );
        }),
      ),
    );
  }
}
