import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/home/widgets/baloon.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/giant_wheel.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InductionsController>();
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      const Positioned(right: 1, top: 50, child: Baloon()),
      Positioned(
          left: 80,
          top: 150,
          child: SizedBox(
              width: size.width / 2.25,
              child: const Center(
                child: Content(
                    logoSize: 200.0,
                    headerSize: 50,
                    bodySize: 30.0,
                    gapSize: 20,
                    gapSize2: 45,
                    buttonSize: 18.0),
              ))),
      Positioned(
          right: 10,
          bottom: -10,
          child: MouseRegion(
              onEnter: (event) => controller.isHovered2.value = 20,
              onExit: (event) => controller.isHovered2.value = 0,
              child: const GiantWheel(hratio: 1.4, wratio: 2))),
      const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Footer(
            size: 16,
          ))
    ]);
  }
}
