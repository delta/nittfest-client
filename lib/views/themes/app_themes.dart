import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xffe91E63);
  static Color primaryColorLight = const Color(0xeef06292);
  static Color primarydarkcolor = const Color(0xff000000);
  static Color bodycolor = Colors.white;
  static Color bodycolorDark = const Color(0xff9e9e9e);
  static Color secondarycolor = const Color.fromARGB(150, 36, 195, 20);
  static Color secondaryaccentcolor = const Color.fromARGB(150, 36, 195, 20);
  static Color secondaryaccentcolor2 = const Color.fromARGB(200, 2, 200, 20);
  static LinearGradient background = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(36, 11, 54, 1.0),
        Color.fromRGBO(95, 20, 50, 1.0),
        Color.fromRGBO(50, 40, 90, 1.0),
      ]);
  static List<Shadow>? shadows = const [
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 4.0,
      color: Color.fromARGB(155, 22, 50, 0),
    ),
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 4.0,
      color: Color.fromARGB(15, 0, 0, 25),
    ),
  ];
}
