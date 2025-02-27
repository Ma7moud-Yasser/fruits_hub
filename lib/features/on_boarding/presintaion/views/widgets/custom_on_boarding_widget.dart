import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper/app_keys.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/size_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CustomOnBoardingWidget extends StatelessWidget {
  const CustomOnBoardingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.backgroundImage,
    required this.image,
    required this.isSkipVisible,
  });

  final Widget title;
  final String subTitle;
  final String backgroundImage;
  final String image;
  final bool isSkipVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeManager.getSize(context).width,
          height: SizeManager.getSize(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isSkipVisible,
                child: SafeArea(
                  child: Padding(
                    padding: PaddingManager.symmetric(
                      context: context,
                      horizontal: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        SharedPrefs.setBool(AppKeys.isOnBoardingViewSeen, true);
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signInScreen,
                        );
                      },
                      child: Text(
                        AppStrings.skip,
                        style: StyleManager.textStyle13(context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: PaddingManager.only(context: context, top: 60, bottom: 25),
          child: title,
        ),
        Padding(
          padding: PaddingManager.symmetric(context: context, horizontal: 40),
          child: Text(
            subTitle,
            style: StyleManager.textStyle13(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
