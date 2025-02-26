import 'package:flutter/material.dart';

class PaddingManager {
  static double _responsiveSize(BuildContext context, double value) {
    double baseSize =
        (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return (value / 1000) * baseSize;
  }

  static EdgeInsets symmetric({
    required BuildContext context,
    double horizontal = 16,
    double vertical = 16,
  }) {
    return EdgeInsets.symmetric(
      horizontal: _responsiveSize(context, horizontal),
      vertical: _responsiveSize(context, vertical),
    );
  }

  static EdgeInsets all({required BuildContext context, double value = 16}) {
    return EdgeInsets.all(_responsiveSize(context, value));
  }

  static EdgeInsets only({
    required BuildContext context,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
      left: _responsiveSize(context, left),
      right: _responsiveSize(context, right),
      top: _responsiveSize(context, top),
      bottom: _responsiveSize(context, bottom),
    );
  }
}
