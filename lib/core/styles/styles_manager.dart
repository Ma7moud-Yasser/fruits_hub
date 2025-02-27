import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/color_manager.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class StyleManager {
  static double responsiveFont(BuildContext context, double fontSize) {
    double scale = scaleFactorCalc(context);
    double scaledFontSize = fontSize * scale;

    double max = fontSize * 1.2;
    double min = fontSize * 0.8;

    return scaledFontSize.clamp(min, max);
  }

  static double scaleFactorCalc(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }

  static TextStyle getTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    required BuildContext context,
  }) {
    // final colorScheme = Theme.of(context).colorScheme;
    final double adjustedFontSize = responsiveFont(context, fontSize);

    Color color;
    if (fontSize < 16) {
      color = AppColor.gray;
    } else if (fontSize <= 24) {
      color = AppColor.back;
    } else {
      color = AppColor.back;
    }

    return TextStyle(
      fontSize: adjustedFontSize,
      fontFamily: GoogleFonts.cairo(fontWeight: fontWeight).fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle textStyle12(BuildContext context) =>
      getTextStyle(fontSize: 12, context: context);
  static TextStyle textStyle13(BuildContext context) =>
      getTextStyle(fontSize: 13, context: context);
  static TextStyle textStyle14(BuildContext context) =>
      getTextStyle(fontSize: 14, context: context);
  static TextStyle textStyle16(BuildContext context) =>
      getTextStyle(fontSize: 16, context: context);
  static TextStyle textStyle18(BuildContext context) =>
      getTextStyle(fontSize: 18, context: context);
  static TextStyle textStyle20(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 20, context: context, fontWeight: fontWeight);
  static TextStyle textStyle22(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 22, context: context, fontWeight: fontWeight);
  static TextStyle textStyle24(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 24, context: context, fontWeight: fontWeight);
  static TextStyle textStyle26(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 26, context: context, fontWeight: fontWeight);
  static TextStyle textStyle28(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 28, context: context, fontWeight: fontWeight);
  static TextStyle textStyle30(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 30, context: context, fontWeight: fontWeight);
  static TextStyle textStyle32(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 32, context: context, fontWeight: fontWeight);
  static TextStyle textStyle50(
    BuildContext context, [
    FontWeight fontWeight = FontWeight.w400,
  ]) => getTextStyle(fontSize: 50, context: context, fontWeight: fontWeight);
}
