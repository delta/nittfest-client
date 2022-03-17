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
    double radius = size.width / 7.5;
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(4),
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
        transform: Matrix4.identity()
          ..setEntry(2, 1, 0.01)
          ..rotateY(0.2),
      ),
      Transform(
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.01)
            ..rotateY(0.2),
          child: Text(
            dept.department,
            style: const TextStyle(fontWeight: FontWeight.w800),
          )),
      Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Container(
          height: height,
          width: size.width / 4.2,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 43, 24, 86),
                Color.fromARGB(255, 79, 45, 140),
                Color.fromARGB(255, 43, 24, 86),
              ]),
              border: Border.symmetric(
                  vertical:
                      BorderSide(color: Color.fromARGB(105, 200, 100, 10)),
                  horizontal:
                      BorderSide(color: Color.fromARGB(100, 220, 100, 10)))),
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.001)
            ..rotateX(0.1),
        ),
        Container(
          height: height - 30,
          width: size.width / 4.2 - 3,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 43, 24, 86),
                Color.fromARGB(255, 79, 45, 140),
                Color.fromARGB(255, 43, 24, 86),
              ]),
              border: Border.symmetric(
                  vertical: BorderSide(color: Color.fromARGB(255, 43, 24, 86)),
                  horizontal:
                      BorderSide(color: Color.fromARGB(205, 43, 24, 86)))),
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
