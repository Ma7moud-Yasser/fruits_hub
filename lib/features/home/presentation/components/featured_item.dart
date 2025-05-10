import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_hub/features/home/presentation/components/featured_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonPressed,
  });
  final String imagePath;
  final String title;
  final String subTitle;
  final void Function() buttonPressed;

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: PaddingManager.symmetric(context: context),
      child: SizedBox(
        width: itemWidth - 16,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Container(
            width: itemWidth,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadiusManager.small(context),
              boxShadow: [
                BoxShadow(
                  color: AppColor.gray.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: itemWidth * 0.4,
                  child: Image.asset(imagePath, fit: BoxFit.fill),
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
                    borderRadius: BorderRadiusManager.small(context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBoxManager.height(context, 30),
                      Text(
                        title,
                        style: StyleManager.textStyle16(
                          context,
                        ).copyWith(color: AppColor.white),
                      ),
                      const Spacer(),
                      Text(
                        subTitle,
                        style: StyleManager.textStyle20(
                          context,
                          FontWeight.bold,
                        ).copyWith(color: AppColor.white),
                      ),
                      const Spacer(),
                      FeaturedButton(
                        onPressed: buttonPressed,
                        text: AppStrings.shoppingNow,
                      ),
                      SizedBoxManager.height(context, 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
