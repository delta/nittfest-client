import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:rive/rive.dart' as rive;

class Car extends StatelessWidget {
  final double assetSize;
  const Car({Key? key, required this.assetSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InductionsController controller = Get.find<InductionsController>();
    return GetPlatform.isMobile
        ? GestureDetector(
            onPanDown: (details) {
              controller.carController.isActive = false;
            },
            onPanEnd: (details) {
              controller.carController.isActive = true;
            },
            child: rive.RiveAnimation.asset(
              'assets/cars.riv',
              fit: BoxFit.fitWidth,
              controllers: [controller.carController],
            ),
          )
        : MouseRegion(
            onEnter: (value) {
              controller.carController.isActive = false;
            },
            onExit: (event) {
              controller.carController.isActive = true;
            },
            child: rive.RiveAnimation.asset(
              'assets/cars.riv',
              fit: BoxFit.fitWidth,
              controllers: [controller.carController],
            ));
  }
}
