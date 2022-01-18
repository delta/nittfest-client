import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/spin_wheel.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Content(
                  logoSize: size.height * 0.2,
                  headerSize: size.height * 0.075,
                  bodySize: size.height * 0.035,
                  bodySize2: size.height * 0.035,
                  gapSize: size.height * 0.015,
                  gapSize2: size.height * 0.01,
                  isDesktop: false,
                  mainAxisAlignment: MainAxisAlignment.center)),
          SizedBox(
              height: size.height * (3.8 / 8),
              child: const SpinWheel(
                isDesktopView: false,
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Footer(size: size.width * 0.03))),
        ]);
  }
}
