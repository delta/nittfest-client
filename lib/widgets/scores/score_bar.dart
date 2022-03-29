import 'package:flutter/material.dart';
import 'package:nittfest/config/themes.dart';
import 'package:nittfest/models/scores_response.dart';

class ScoreBar extends StatelessWidget {
  final double height;
  final ScoresResponse dept;
  const ScoreBar({Key? key, required this.height, required this.dept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double radius = size.width / 8.5;
    return Column(children: [
      Card(
          color: Colors.black54,
          shadowColor: Colors.amber,
          shape: const CircleBorder(),
          margin: const EdgeInsets.all(4),
          elevation: 2,
          child: Container(
            margin: const EdgeInsets.all(2),
            width: radius,
            height: radius,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.logoBorder)),
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-0.2),
            child: Image.asset(
              'https://static.nittfest.org/images/departments/' +
                  dept.department +
                  '.png',
            ),
          )),
      Transform(
          transform: Matrix4.identity()
            ..setEntry(2, 1, 0.01)
            ..rotateY(0.2),
          child: Text(
            dept.department,
            style: const TextStyle(fontWeight: FontWeight.w800),
          )),
      const SizedBox(height: 10),
      Stack(alignment: AlignmentDirectional.bottomStart, children: [
        Container(
          height: height,
          width: size.width / 4 + 3,
          decoration: BoxDecoration(
              gradient: AppTheme.podiumBack,
              border: Border.all(
                color: AppTheme.podiumBackBorder,
              )),
          transform: Matrix4.identity()
            ..setEntry(2, 2, 0.001)
            ..rotateX(0.1),
        ),
        Container(
            height: height - 30,
            width: size.width / 4 + 3,
            decoration: BoxDecoration(
                gradient: AppTheme.podiumFront,
                border: Border.all(color: AppTheme.podiumFrontBorder)),
            transform: Matrix4.identity()
              ..setEntry(2, 2, 0.0009)
              ..rotateX(0.1),
            child: Center(
                child: Container(
                    height: size.width / 7,
                    width: size.width / 7,
                    alignment: Alignment.center,
                    child: Text(
                      dept.position[1],
                      style: TextStyle(
                          fontSize: size.width / 10.5,
                          fontWeight: FontWeight.bold),
                    )))),
      ])
    ]);
  }
}
