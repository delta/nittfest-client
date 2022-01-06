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
      const Expanded(
        child: Content(
            logoSize: 150.0,
            headerSize: 30,
            bodySize: 25.0,
            gapSize: 15,
            gapSize2: 30,
            buttonSize: 12.0),
      ),
      Expanded(
          child: Stack(children: [
        Positioned(
            right: 0,
            bottom: -10,
            height: size.height / 2.2,
            child: const GiantWheel(
              wratio: 1.8,
              hratio: 1.8,
            )),
        const Positioned(bottom: 10, left: 0, right: 0, child: Footer(size: 12))
      ]))
    ]);
  }
}
