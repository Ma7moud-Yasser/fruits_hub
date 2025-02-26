import 'package:flutter/material.dart';

class PaddingManager {
  static EdgeInsets main(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(
      horizontal: size.width * 0.05,
      // vertical: size.height * 0.03,
    );
  }

  static EdgeInsets iconTextForm(BuildContext context) {
    return EdgeInsets.all(MediaQuery.of(context).size.width * 0.03);
  }

  static EdgeInsets rememberForgetPassword(BuildContext context) {
    return EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.009,
    );
  }

  static EdgeInsets dontHaveAnAccount(BuildContext context) {
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
