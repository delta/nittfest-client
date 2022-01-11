import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/giant_wheel.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      Expanded(
        child: Content(
            logoSize: size.height * 0.20,
            headerSize: size.height * 0.050,
            bodySize: size.height * 0.030,
            gapSize: size.height * 0.005,
            gapSize2: size.height * 0.025,
            buttonSize: size.height * 0.025),
      ),
      Expanded(
          child: Stack(children: [
        Positioned(
            right: 0,
            bottom: -10,
            height: size.height / 2.2,
            child: const GiantWheel()),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Footer(size: size.width * 0.025))
      ]))
    ]);
  }
}
