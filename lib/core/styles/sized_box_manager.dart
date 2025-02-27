import 'package:flutter/material.dart';

class SizedBoxManager {
  static double responsiveSize(BuildContext context, double value) {
    double baseSize =
        (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return (value / 1000) * baseSize;
  }

  static SizedBox height(BuildContext context, double value) {
    return SizedBox(height: responsiveSize(context, value));
  }

  static SizedBox width(BuildContext context, double value) {
    return SizedBox(width: responsiveSize(context, value));
  }

  static SizedBox square(BuildContext context, double value) {
    double size = responsiveSize(context, value);
    return SizedBox(width: size, height: size);
  }
}
