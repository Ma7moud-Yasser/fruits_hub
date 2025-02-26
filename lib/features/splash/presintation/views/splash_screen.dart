import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(IconsAssets.splashTop),
              Center(child: SvgPicture.asset(IconsAssets.splashIcon)),
              SvgPicture.asset(IconsAssets.splashBottom),
            ],
          ),
        ),
      ),
    );
  }
}
