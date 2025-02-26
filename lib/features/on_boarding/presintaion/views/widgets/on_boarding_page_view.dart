import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
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
                title: Container(
                  child: Text(
                    'Welcome to Fruits Hub',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
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
