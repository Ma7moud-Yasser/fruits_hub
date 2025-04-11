import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/assets_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  final ValueNotifier<bool> isTermsAccepted;

  const TermsAndConditionsWidget({super.key, required this.isTermsAccepted});

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: isTermsAccepted.value,

      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: isTermsAccepted,
                  builder: (context, value, _) {
                    return GestureDetector(
                      onTap: () {
                        isTermsAccepted.value = !value;
                        formFieldState.didChange(isTermsAccepted.value);
                      },
                      child: SvgPicture.asset(
                        value
                            ? IconsAssets.checkBoxFill
                            : IconsAssets.checkBoxEmpty,
                      ),
                    );
                  },
                ),
                SizedBoxManager.width(context, 16),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.iAgreeToThe,
                          style: StyleManager.textStyle14(
                            context,
                            FontWeight.w400,
                          ),
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
            ),
            if (formFieldState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  formFieldState.errorText!,
                  style: TextStyle(color: AppColor.important, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
