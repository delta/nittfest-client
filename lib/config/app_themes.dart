import 'package:flutter/material.dart';

class AppTheme {
  static Color primarydarkcolor = const Color(0xff000000);
  static Color logoColor1 = const Color(0xFFee2939);
  static Color logoColor2 = Colors.yellow;
  static List<Color> bgcolors = [
    Colors.black,
    Colors.black26,
    const Color.fromRGBO(100, 40, 60, 1.0),
    Colors.black54,
  ];
  static List<BoxShadow> logoShade1 = const [
    BoxShadow(
        offset: Offset(0.0, 0.0), blurRadius: 40.0, color: Color(0x66F72119))
  ];
  static List<BoxShadow> logoShade2 = const [
    BoxShadow(
        offset: Offset(0.0, 0.0), blurRadius: 40.0, color: Color(0x55FFC42E))
  ];
}
