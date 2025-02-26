import 'package:flutter/material.dart';

class BorderRadiusManager {
  /// BorderRadius صغيرة
  static BorderRadius small(BuildContext context) {
    return BorderRadius.circular(_calculateRadius(context, 8));
  }

  /// BorderRadius متوسطة
  static BorderRadius medium(BuildContext context) {
    return BorderRadius.circular(_calculateRadius(context, 16));
  }

  /// BorderRadius كبيرة
  static BorderRadius large(BuildContext context) {
    return BorderRadius.circular(_calculateRadius(context, 24));
  }

  /// BorderRadius دائرية بالكامل
  static BorderRadius circular(BuildContext context) {
    return BorderRadius.circular(_calculateRadius(context, 50));
  }

  /// BorderRadius مخصصة لكل زاوية بشكل مختلف
  static BorderRadius custom({
    required BuildContext context,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(_calculateRadius(context, topLeft)),
      topRight: Radius.circular(_calculateRadius(context, topRight)),
      bottomLeft: Radius.circular(_calculateRadius(context, bottomLeft)),
      bottomRight: Radius.circular(_calculateRadius(context, bottomRight)),
    );
  }

  static double _calculateRadius(BuildContext context, double baseRadius) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 375) * baseRadius;
  }
}
