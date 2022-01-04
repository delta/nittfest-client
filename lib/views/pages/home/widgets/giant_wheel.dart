import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';

class GiantWheel extends StatelessWidget {
  final double wratio;
  final double hratio;
  const GiantWheel({Key? key, required this.wratio, required this.hratio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InductionsController>();
    Size size = MediaQuery.of(context).size;
    return Obx(() => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.outer,
              spreadRadius: 100,
              offset: const Offset(50, 65),
              color: Colors.purple.withOpacity(0.16)),
        ], shape: BoxShape.circle),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            transform: Matrix4.identity()
              ..setEntry(3, 1, 0.000001)
              ..rotateY(controller.isHovered2.value / 180 * pi),
            child: Image.asset(
              'assets/wheel.png',
              height: size.height / hratio,
              width: size.width / wratio,
              fit: BoxFit.contain,
            ))));
  }
}
