import 'package:flutter/material.dart';
import 'package:nittfest/models/scores_response.dart';

class ScoreBar extends StatelessWidget {
  final double height;
  final ScoresResponse dept;
  const ScoreBar({Key? key, required this.height, required this.dept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(4),
        width: size.width / 8,
        height: size.width / 8,
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
      ),
      Text(dept.department),
      Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Container(
          height: height,
          width: size.width / 4.5,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(240, 255, 180, 10),
                Color.fromARGB(220, 235, 120, 20),
              ]),
              border:
                  Border.all(color: const Color.fromARGB(255, 150, 107, 10))),
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.001)
            ..rotateX(0.1),
        ),
        Container(
          height: height - 30,
          width: size.width / 4.5 - 3,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(240, 255, 140, 10),
                Color.fromARGB(255, 249, 167, 20),
              ]),
              border:
                  Border.all(color: const Color.fromARGB(255, 170, 100, 10))),
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.0009)
            ..rotateX(0.2),
          child: Center(
              child: Text(
            dept.position[1],
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
      ])
    ]);
  }
}
