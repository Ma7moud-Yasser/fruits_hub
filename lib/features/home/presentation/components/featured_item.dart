import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/features/home/presentation/components/featured_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,

      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: itemWidth * 0.4,
              child: Image.asset(ImagesAssets.featuredItem2, fit: BoxFit.fill),
            ),

            Container(
              padding: PaddingManager.symmetric(
                context: context,
                horizontal: 25,
                vertical: 0,
              ),
              width: itemWidth * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: svg.Svg(IconsAssets.featuredItemBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBoxManager.height(context, 30),
                  Text(
                    AppStrings.eidOffers,
                    style: StyleManager.textStyle16(
                      context,
                    ).copyWith(color: AppColor.white),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.offer25,
                    style: StyleManager.textStyle20(
                      context,
                      FontWeight.bold,
                    ).copyWith(color: AppColor.white),
                  ),
                  const Spacer(),
                  FeaturedButton(
                    onPressed: () {},
                    text: AppStrings.shoppingNow,
                  ),
                  SizedBoxManager.height(context, 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
