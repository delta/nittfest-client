import 'package:flutter/material.dart';

class GiantWheel extends StatelessWidget {
  const GiantWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Opacity(
      opacity: 0.87,
      child: Image.asset(
        'assets/wheel.png',
        fit: BoxFit.cover,
      ));
}
