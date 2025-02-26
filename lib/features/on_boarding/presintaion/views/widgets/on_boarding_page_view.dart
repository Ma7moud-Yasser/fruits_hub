import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
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
                subTitle: AppStrings.onBoardingSubTitle1,
                backgroundImage: IconsAssets.onBoardingBG1,
                image: IconsAssets.onBoarding1,
              ),
              CustomOnBoardingWidget(
                title: Text(
                  AppStrings.onBoardingTitle2,
                  style: StyleManager.textStyle24(context),
                ),
                subTitle: AppStrings.onBoardingSubTitle2,
                backgroundImage: IconsAssets.onBoardingBG2,
                image: IconsAssets.onBoarding2,
              ),
            ],
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color: AppColor.primary,
            activeColor: AppColor.primary.withOpacity(0.5),
          ),
        ),
        SizedBoxManager.height(context, 30),
        Padding(
          padding: PaddingManager.symmetric(context: context, vertical: 0),
          child: CustomButton(onPressed: () {}, text: AppStrings.startNow),
        ),
        SizedBoxManager.height(context, 43),
      ],
    );
  }
}
