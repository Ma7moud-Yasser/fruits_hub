import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/styles/border_radius_manager.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:fruits_hub/core/styles/padding_manager.dart';
import 'package:fruits_hub/core/styles/styles_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final bool isEditing;
  final String? label;
  final String? prefixIconPath;
  final Widget? suffixIconWidget;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    this.validator,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isEditing = true,
    this.onTap,
    this.obscureText = false,
    this.keyboardType,
    this.label = '',
    this.prefixIconPath,
    this.suffixIconWidget,
    super.key,
    this.onSaved,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      enabled: widget.isEditing,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onSaved: widget.onSaved,
      style: StyleManager.textStyle16(
        context,
        FontWeight.w600,
      ).copyWith(color: AppColor.back),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.silverSky,
        hintText: widget.hintText,
        hintStyle: StyleManager.textStyle14(context, FontWeight.w700),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.silverSky),
          borderRadius: BorderRadiusManager.small(context),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadiusManager.small(context),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadiusManager.small(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColor.darkSilverSky),
          borderRadius: BorderRadiusManager.small(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadiusManager.small(context),
        ),
        suffixIcon: widget.suffixIconWidget ?? widget.suffixIconWidget,
        prefixIcon:
            widget.prefixIconPath == null || widget.prefixIconPath == ''
                ? null
                : Padding(
                  padding: PaddingManager.symmetric(context: context),
                  child: SvgPicture.asset(widget.prefixIconPath!),
                ),
      ),

      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
