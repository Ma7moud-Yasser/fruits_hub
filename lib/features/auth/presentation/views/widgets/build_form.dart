import 'package:flutter/material.dart';
import 'package:fruits_hub/core/components/custom_text_form.dart';
import 'package:fruits_hub/core/helper/app_strings.dart';
import 'package:fruits_hub/core/styles/sized_box_manager.dart';
import 'package:fruits_hub/core/utils/validation_manager.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/PasswordValidationWidget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_condition_widget.dart';
import 'package:fruits_hub/features/auth/signUpCubit/sin_up_cubit.dart';

Widget buildForm(BuildContext context, SignUpCubit cubit) {
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  return Form(
    key: cubit.formKey,
    autovalidateMode: _autovalidateMode,
    child: Column(
      children: [
        CustomTextFormField(
          controller: cubit.nameController,
          hintText: AppStrings.fullName,
          validator: ValidationManager.validateName,
        ),
        SizedBoxManager.height(context, 16),
        CustomTextFormField(
          controller: cubit.emailController,
          hintText: AppStrings.email,
          validator: ValidationManager.validateEmail,
        ),
        SizedBoxManager.height(context, 16),
        PasswordValidationWidget(passwordController: cubit.passwordController),
        SizedBoxManager.height(context, 16),
        const TermsAndConditionsWidget(),
        SizedBoxManager.height(context, 30),
      ],
    ),
  );
}
