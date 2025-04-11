import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.title,
    required this.iconPath,
    this.onPressed,
  });
  final String title;
  final String iconPath;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.only(context: context, top: 16),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadiusManager.medium(context),
            side: BorderSide(color: AppColor.darkSilverSky, width: 1),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(iconPath, width: 30),
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: StyleManager.textStyle16(context, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
