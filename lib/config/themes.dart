import 'package:flutter/material.dart';

class AppTheme {
  static bool isDark = true;
  static Color primarydarkcolor = const Color(0xff000000);
  static Color logoColor1 = const Color(0xFFee2939);
  static Color logoColor2 = Colors.yellow;
  static LinearGradient bgs = LinearGradient(
      colors: isDark
          ? const [
              Color(0xff08010D),
              Color(0xff100319),
              Color(0xff08010D),
            ]
          : const [Color(0xffFBF6EE), Color(0xffF9F6EE)]);

  static List<Color> bgcolors = [
    const Color.fromRGBO(50, 50, 50, 0.5),
    const Color(0xff121222),
  ];
  static List<BoxShadow> logoShade1 = const [
    BoxShadow(
        offset: Offset(0.0, 0.0), blurRadius: 40.0, color: Color(0x66F72119))
  ];
  static List<BoxShadow> logoShade2 = const [
    BoxShadow(
        offset: Offset(0.0, 0.0), blurRadius: 40.0, color: Color(0x55FFC42E))
  ];
  static List<BoxShadow> bottomShadow = const [
    BoxShadow(
        offset: Offset(0.0, 0.0), blurRadius: 40.0, color: Color(0xff000333))
  ];
  static LinearGradient logobg = const LinearGradient(colors: [
    Color.fromARGB(240, 255, 180, 10),
    Color.fromARGB(220, 255, 100, 20),
  ]);
  static Color logoBorder = const Color.fromARGB(255, 150, 107, 10);

  static LinearGradient cardbg = LinearGradient(
      colors: isDark
          ? const [
              Color.fromARGB(255, 43, 24, 86),
              Color.fromARGB(255, 79, 45, 140),
              Color.fromARGB(255, 43, 24, 86),
            ]
          : const [
              Color(0xff7b68ee),
              Color(0xff7b68ee),
            ]);

  static LinearGradient podiumBack = LinearGradient(
      colors: isDark
          ? const [
              Color.fromARGB(255, 200, 90, 10),
              Color.fromARGB(220, 225, 130, 20),
              Color.fromARGB(220, 225, 110, 20),
            ]
          : const [
              Color.fromARGB(255, 43, 24, 86),
              Color.fromARGB(255, 79, 45, 140),
              Color.fromARGB(255, 43, 24, 86),
            ]);

  static Color podiumBackBorder = isDark
      ? const Color.fromARGB(255, 200, 70, 10)
      : const Color.fromARGB(255, 62, 61, 63);

  static LinearGradient podiumFront = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      tileMode: TileMode.clamp,
      colors: isDark
          ? const [
              Color.fromARGB(255, 190, 75, 10),
              Color.fromARGB(220, 225, 140, 20),
              Color.fromARGB(220, 225, 140, 20),
              Color.fromARGB(210, 190, 75, 10),
            ]
          : const [
              Color.fromARGB(255, 43, 24, 86),
              Color.fromARGB(255, 79, 45, 140),
              Color.fromARGB(255, 43, 24, 86),
            ]);

  static Color podiumFrontBorder = isDark
      ? const Color.fromARGB(255, 200, 100, 10)
      : const Color.fromARGB(255, 92, 61, 123);

  static Color bottomIconBg = isDark
      ? const Color.fromARGB(255, 249, 167, 20)
      : const Color.fromARGB(255, 177, 156, 217);

  static Color bottomIconColor = isDark ? Colors.black : Colors.white;

  static Color bottombarBg = isDark ? const Color(0xff121222) : Colors.white;

  static Color scoresbgCard = isDark
      ? const Color.fromARGB(255, 16, 16, 16)
      : const Color.fromARGB(255, 255, 255, 255);

  static LinearGradient scoresbg = LinearGradient(
      colors: isDark
          ? const [Color(0xff121222), Color(0xff121222)]
          : const [
              Color.fromARGB(255, 230, 230, 250),
              Color.fromARGB(255, 230, 230, 250),
            ]);
}
