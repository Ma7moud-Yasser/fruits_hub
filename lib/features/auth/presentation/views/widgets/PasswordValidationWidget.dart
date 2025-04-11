import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';

// ignore: must_be_immutable
class PasswordValidationWidget extends StatefulWidget {
  bool allConditionsMet = false;
  final TextEditingController passwordController;
  bool isPasswordVisible = true;

  PasswordValidationWidget({super.key, required this.passwordController});

  @override
  State<PasswordValidationWidget> createState() =>
      _PasswordValidationWidgetState();
}

class _PasswordValidationWidgetState extends State<PasswordValidationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checklist = ValidationManager.validatePasswordChecklist(
      widget.passwordController.text,
    );

    widget.allConditionsMet = checklist.values.every((isValid) => isValid);

    return Column(
      children: [
        CustomTextFormField(
          obscureText: widget.isPasswordVisible,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty || value.trim().isEmpty) {
              return AppStrings.passwordIsRequired;
            } else {
              return null;
            }
          },
          hintText: AppStrings.password,
          controller: widget.passwordController,
          onChanged: (value) {
            setState(() {});
          },

          suffixIconWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.allConditionsMet)
                Icon(
                  Icons.check_circle,
                  color: AppColor.lightPrimary,
                  size: 24,
                ),
              IconButton(
                icon: Icon(
                  widget.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColor.stoneLight,
                ),
                onPressed: () {
                  setState(() {
                    widget.isPasswordVisible = !widget.isPasswordVisible;
                  });
                },
              ),
            ],
          ),
        ),
        if (widget.passwordController.text.isNotEmpty &&
            !widget.allConditionsMet)
          ...checklist.entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Icon(
                    entry.value ? Icons.check_circle : Icons.cancel,
                    color:
                        entry.value
                            ? AppColor.lightPrimary
                            : AppColor.important,
                    size: 18,
                  ),
                  SizedBoxManager.width(context, 10),
                  Text(
                    entry.key,
                    style: StyleManager.textStyle14(
                      context,
                      FontWeight.w400,
                    ).copyWith(
                      color:
                          entry.value
                              ? AppColor.lightPrimary
                              : AppColor.important,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
