import 'package:flutter/material.dart';

class ColorUtils {
  static Color parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return Colors.transparent;
    var formatted = hex.replaceAll('#', '');
    if (formatted.length == 6) {
      formatted = 'FF$formatted';
    }
    return Color(int.parse(formatted, radix: 16));
  }
}
