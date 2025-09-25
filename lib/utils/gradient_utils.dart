import 'package:flutter/material.dart';

class GradientUtils {
  static Alignment getBegin(double angle) {
    if (angle == 90) return Alignment.topCenter;
    if (angle == 180) return Alignment.centerRight;
    if (angle == 270) return Alignment.bottomCenter;
    return Alignment.centerLeft;
  }

  static Alignment getEnd(double angle) {
    if (angle == 90) return Alignment.bottomCenter;
    if (angle == 180) return Alignment.centerLeft;
    if (angle == 270) return Alignment.topCenter;
    return Alignment.centerRight;
  }
}
