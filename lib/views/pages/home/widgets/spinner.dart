import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/views/pages/home/widgets/wheel.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    dev.log(size.width.toString());
    return SizedBox(
        height: size.height / 1.5,
        width: size.width,
        child: Obx(
          () => GestureDetector(
            onPanDown: (details) =>
                controller.currentPointer = details.localPosition,
            onPanUpdate: (details) => controller.updateStartAngle(details),
            onPanEnd: (details) => controller.adjust(),
            child: CustomPaint(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        spreadRadius: size.width / 1.8,
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(0, -10))
                  ], shape: BoxShape.circle),
                ),
                painter: Wheel(controller.startAngle.value, size)),
          ),
        ));
  }
}
