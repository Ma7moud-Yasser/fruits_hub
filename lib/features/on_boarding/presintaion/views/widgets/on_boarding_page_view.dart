import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_button.dart';
import 'package:fruits_hub/core/helper/app_keys.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/features/on_boarding/presintaion/views/widgets/custom_on_boarding_widget.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              CustomOnBoardingWidget(
                isSkipVisible: true,
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
                isSkipVisible: false,
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
            activeColor: AppColor.primary,
            color:
                currentPage == 1
                    ? AppColor.primary
                    : AppColor.primary.withOpacity(0.5),
          ),
        ),
        SizedBoxManager.height(context, 30),
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage == 1,
          child: Padding(
            padding: PaddingManager.symmetric(context: context, vertical: 0),
            child: CustomButton(
              onPressed: () {
                SharedPrefs.setBool(AppKeys.isOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(context, Routes.signInScreen);
              },
              text: AppStrings.startNow,
            ),
          ),
        ),
        SizedBoxManager.height(context, 43),
      ],
    );
  }
}
