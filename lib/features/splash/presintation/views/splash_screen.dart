import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/helper/on_generate_routes.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [SvgPicture.asset(IconsAssets.splashTop)]),
              Center(child: SvgPicture.asset(IconsAssets.splashIcon)),
              SvgPicture.asset(IconsAssets.splashBottom, fit: BoxFit.fill),
            ],
          ),
        ),
      ),
    );
  }

  void exCuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
    });
  }
}
