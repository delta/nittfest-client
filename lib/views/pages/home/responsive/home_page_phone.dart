import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/register_button.dart';
import 'package:nittfest/views/pages/home/widgets/spinner.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: size.height * (4 / 9),
              child: Content(
                  logoSize: size.height * 0.20,
                  headerSize: size.height * 0.050,
                  bodySize: size.height * 0.030,
                  gapSize: size.height * 0.05,
                  gapSize2: size.height * 0.25,
                  mainAxisAlignment: MainAxisAlignment.center)),
          SizedBox(height: size.height * (3.5 / 9), child: const Spinner()),
          SizedBox(
              height: size.height * (1 / 18),
              child: RegisterButton(
                buttonSize: size.height * (1 / 18) * 0.3,
              )),
          SizedBox(
              height: size.height * (1 / 9),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Footer(size: size.width * 0.025))),
          // Expanded(
          //     child: Stack(children: [
          //   Positioned(
          //       right: 0,
          //       bottom: -10,
          //       height: size.height / 2.2,
          //       child: const Spinner()),
          //   Positioned(
          //       bottom: 10,
          //       left: 0,
          //       right: 0,
          //       child: Footer(size: size.width * 0.025))
          // ]))
        ]);
  }
}
