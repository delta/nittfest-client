import 'package:flutter/material.dart';
import 'package:nittfest/views/pages/home/widgets/car.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class FormsPagePhone extends StatelessWidget {
  const FormsPagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: AppTheme.background),
            height: size.height,
            child: Stack(children: [
              Positioned(
                  left: 50,
                  right: 50,
                  top: 80,
                  child: SizedBox(
                    height: size.height / 2,
                    child: const Content(
                        logoSize: 100.0,
                        headerSize: 24.0,
                        bodySize: 18.0,
                        buttonSize: 16.0),
                  )),
              Positioned(
                left: 50,
                right: -90,
                bottom: -95,
                child: SizedBox(
                    height: size.height / 2, child: const Car(assetSize: 2)),
              ),
            ])));
  }
}
