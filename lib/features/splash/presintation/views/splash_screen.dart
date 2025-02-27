import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/helper/app_keys.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    exCuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    bool isArabic = currentLocale.languageCode == "ar";
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment:
                  isArabic ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [SvgPicture.asset(IconsAssets.splashTop)],
            ),
            Center(child: SvgPicture.asset(IconsAssets.splashIcon)),
            SvgPicture.asset(IconsAssets.splashBottom, fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }

  void exCuteNavigation() {
    bool? isOnBoardingViewSeen =
        SharedPrefs.getBool(AppKeys.isOnBoardingViewSeen) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      isOnBoardingViewSeen
          ? Navigator.pushReplacementNamed(context, Routes.signInScreen)
          : Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
    });
  }
}
