import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.height / 14;
    return Center(
        child: Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.redAccent,
              spreadRadius: 1,
            )
          ],
          shape: BoxShape.circle,
          gradient: const LinearGradient(colors: [
            Color.fromARGB(240, 255, 180, 10),
            Color.fromARGB(220, 255, 100, 20),
          ]),
          border: Border.all(color: const Color.fromARGB(255, 150, 107, 10))),
    ));
  }
}
