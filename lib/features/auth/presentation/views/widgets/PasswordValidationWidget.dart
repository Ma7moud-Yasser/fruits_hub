import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';

// ignore: must_be_immutable
class PasswordValidationWidget extends StatefulWidget {
  bool allConditionsMet;
  String? password;

  PasswordValidationWidget({
    super.key,
    required this.allConditionsMet,
    this.password,
  });

  @override
  State<PasswordValidationWidget> createState() =>
      _PasswordValidationWidgetState();
}

class _PasswordValidationWidgetState extends State<PasswordValidationWidget> {
  // إنشاء controller للتأكد من التعامل مع التحديثات بشكل مستمر
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.text =
        widget.password ?? ''; // تحديد النص الأولي إذا كان موجودًا
  }

  @override
  Widget build(BuildContext context) {
    // التحقق من الشروط بناءً على كلمة المرور
    final checklist = ValidationManager.validatePasswordChecklist(
      _passwordController.text,
    );

    // التحقق إذا كانت جميع الشروط متحققة
    widget.allConditionsMet = checklist.values.every((isValid) => isValid);

    return Column(
      children: [
        CustomTextFormField(
          hintText: AppStrings.password,
          controller: _passwordController,
          onChanged: (value) {
            setState(() {
              widget.password = value;
            });
          },
          onSaved: (value) {
            widget.password = value;
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
        if (widget.password != null &&
            widget.password!.isNotEmpty &&
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

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}
