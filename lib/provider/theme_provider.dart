import '../classes/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final MyTheme theme = MyTheme(
      name: '1',
      unSelectedSolutionIconColor: const Color(0xffCACBCD),
      bodyTextColor: const Color(0xff131415),
      focusColor:const Color(0xffD3D3D3),
      unFocusColor:const Color(0xff606060),
      optionColor: const Color(0xffFEC303),
      primaryColor: const Color(0xffF7F7F7),
      backgroundColor: const Color(0xffF7F7F7));

  bool copyWith(MyTheme newTheme) {
    return theme.name == newTheme.name;
  }
}
