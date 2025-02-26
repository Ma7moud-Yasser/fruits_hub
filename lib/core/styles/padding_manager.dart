import 'package:flutter/material.dart';

class PaddingManager {
  static EdgeInsets main(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(
      horizontal: size.width * 0.05,
      // vertical: size.height * 0.03,
    );
  }

  static EdgeInsets paddingHorizontal04Vertical015(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.04,
      vertical: MediaQuery.of(context).size.height * 0.015,
    );
  }

  static EdgeInsets paddingHorizontal10(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.1,
    );
  }

  static EdgeInsets vertical05(BuildContext context) {
    return EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.05,
    );
  }

  static EdgeInsets vertical03(BuildContext context) {
    return EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.03,
    );
  }

  static EdgeInsets custom({
    required BuildContext context,
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.only(
      left: left > 0 ? left : size.width * 0.04,
      top: top > 0 ? top : size.height * 0.02,
      right: right > 0 ? right : size.width * 0.04,
      bottom: bottom > 0 ? bottom : size.height * 0.02,
    );
  }
}
