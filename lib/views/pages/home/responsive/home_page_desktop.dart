import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/home/widgets/baloon.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/register_button.dart';
import 'package:nittfest/views/pages/home/widgets/spin_wheel.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Row(children: [
        Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Content(
            mainAxisAlignment: MainAxisAlignment.center,
            logoSize: (300.0 / 1848) * size.width,
            headerSize: (70 / 1848) * size.width,
            bodySize: (32.0 / 1848) * size.width,
            gapSize: (20 / 980) * size.height,
            gapSize2: (40 / 980) * size.height,
          ),
          SizedBox(height: (40 / 980) * size.height),
          RegisterButton(buttonSize: (350.0 / 1848) * size.width),
        ])),
        Expanded(
            child: Stack(children: const [
          Positioned(right: 1, top: 50, child: Baloon()),
          Center(
              child: SpinWheel(
            isDesktopView: true,
          )),
        ])),
      ]),
      const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
              child: Footer(
            size: 16,
          ))),
    ]);
  }
}
