import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class Baloon extends StatelessWidget {
  const Baloon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    return Obx(() => MouseRegion(
        onEnter: (event) => controller.isHovered.value = true,
        onExit: (event) => controller.isHovered.value = false,
        child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: controller.isHovered.value
                ? size.width / 4.5
                : size.width / 5.5,
            height: controller.isHovered.value
                ? size.height / 4.5
                : size.height / 5.5,
            child: Image.asset(
              'assets/baloon.png',
              fit: BoxFit.fitHeight,
            ))));
  }
}
