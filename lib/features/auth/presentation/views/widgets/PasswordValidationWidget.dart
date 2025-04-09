import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';

// ignore: must_be_immutable
class PasswordValidationWidget extends StatefulWidget {
  bool allConditionsMet;
  final TextEditingController passwordController;
  bool isPasswordVisible;

  PasswordValidationWidget({
    super.key,
    required this.allConditionsMet,
    required this.passwordController,
    this.isPasswordVisible = true,
  });

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

          hintText: AppStrings.password,
          controller: widget.passwordController, // تمرير الـ controller
          onChanged: (value) {
            setState(() {
              // هنا لا داعي لأن نحدث الـ password مباشرة لأنه يتم تحديثه عبر الـ controller
            });
          },
          onSaved: (value) {
            // يمكن حفظ الـ value هنا إذا لزم الأمر
          },
          suffixIconWidget:
              widget.allConditionsMet
                  ? Icon(
                    Icons.check_circle,
                    color: AppColor.lightPrimary,
                    size: 24,
                  )
                  : null, // عرض الأيقونة فقط إذا كانت الشروط متحققة
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
                  const SizedBox(width: 8),
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
