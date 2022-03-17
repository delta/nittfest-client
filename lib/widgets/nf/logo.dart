import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 80,
        height: 80,
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
        transform: Matrix4.identity()
          ..setEntry(2, 1, 0.01)
          ..rotateY(0.2),
      );
}
