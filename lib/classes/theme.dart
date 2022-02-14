import 'package:flutter/material.dart';

class MyTheme {
  final String name;
  final Color bodyTextColor;
  final Color focusColor;
  final Color unFocusColor;
  final Color unSelectedSolutionIconColor;
  late final MaterialColor primaryColorMaterial;
  final Color primaryColor;
  final Color optionColor;
  final Color backgroundColor;

  MyTheme(
      {required this.name,

      required this.unSelectedSolutionIconColor,
      required this.focusColor,
      required this.unFocusColor,
      required this.optionColor,
      required this.bodyTextColor,
      required this.primaryColor,
      required this.backgroundColor}) {
    primaryColorMaterial = _createMaterialColor(primaryColor);
  }

  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
