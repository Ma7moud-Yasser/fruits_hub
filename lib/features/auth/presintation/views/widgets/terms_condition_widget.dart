import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  _TermsAndConditionsWidgetState createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isChecked,
          builder:
              (context, value, child) => GestureDetector(
                onTap: () => isChecked.value = !isChecked.value,
                child: SvgPicture.asset(
                  value ? IconsAssets.checkBoxFill : IconsAssets.checkBoxEmpty,
                ),
              ),
        ),
        SizedBoxManager.width(context, 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.iAgreeToThe,
                  style: StyleManager.textStyle14(context, FontWeight.w400),
                ),
                TextSpan(
                  text: AppStrings.termsAndPrivacyOfService,
                  style: StyleManager.textStyle14(
                    context,
                    FontWeight.w600,
                  ).copyWith(color: AppColor.lightPrimary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
