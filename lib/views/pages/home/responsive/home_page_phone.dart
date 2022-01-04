import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/giant_wheel.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InductionsController>();
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          left: 50,
          right: 50,
          top: 20,
          child: SizedBox(
            height: size.height / 2,
            child: const Content(
                logoSize: 150.0,
                headerSize: 25,
                bodySize: 20.0,
                gapSize: 0,
                gapSize2: 0,
                buttonSize: 12.0),
          )),
      Positioned(
          right: 0,
          bottom: -50,
          child: GestureDetector(
              onTapDown: (event) => controller.isHovered2.value = 25,
              onTapUp: (event) => controller.isHovered2.value = 0,
              child: const GiantWheel(
                wratio: 2,
                hratio: 2,
              ))),
      const Positioned(bottom: 10, left: 0, right: 0, child: Footer(size: 12))
    ]);
  }
}
