import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/features/on_boarding/presintaion/views/widgets/custom_on_boarding_widget.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            children: [
              CustomOnBoardingWidget(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.onBoardingTitle1,
                      style: StyleManager.textStyle24(context),
                    ),
                    SizedBox(width: 10),
                    Text(
                      AppStrings.appSecondName,
                      style: StyleManager.textStyle24(
                        context,
                      ).copyWith(color: AppColor.secondary),
                    ),
                    Text(
                      AppStrings.appFirstName,
                      style: StyleManager.textStyle24(
                        context,
                      ).copyWith(color: AppColor.primary),
                    ),
                  ],
                ),
                subTitle: AppStrings.onBoardingSubTitle2,
                backgroundImage: IconsAssets.onBoardingBG2,
                image: IconsAssets.onBoarding1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
