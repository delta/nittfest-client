import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/inductions/widgets/car.dart';
import 'package:nittfest/views/pages/inductions/widgets/content.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class InductionsPageDesktop extends StatelessWidget {
  const InductionsPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: AppTheme.background),
            height: size.height,
            child: Stack(children: [
              Positioned(
                  left: 80,
                  top: 100,
                  child: SizedBox(
                    width: size.width / 2,
                    child: const Content(
                        logoSize: 200,
                        headerSize: 54.0,
                        bodySize: 22.0,
                        buttonSize: 20.0),
                  )),
              Positioned(
                  right: -120,
                  bottom: -90,
                  child: SizedBox(
                      height: size.height / 1.8,
                      width: size.width / 1.8,
                      child: const Car(assetSize: 1.8)))
            ])));
  }
}
