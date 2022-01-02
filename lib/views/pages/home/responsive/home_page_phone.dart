import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';

class HomePagePhone extends StatelessWidget {
  const HomePagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InductionsController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('bg1.webp'), fit: BoxFit.cover)),
            height: size.height,
            child: Stack(children: [
              Positioned(
                  left: 50,
                  right: 50,
                  top: 20,
                  child: SizedBox(
                    height: size.height / 2,
                    child: const Content(
                        logoSize: 120.0,
                        headerSize: 25,
                        bodySize: 16.0,
                        buttonSize: 12.0),
                  )),
              Positioned(
                  right: 1,
                  bottom: -50,
                  child: Obx(() => GestureDetector(
                      onTapDown: (details) => controller.isHovered2.value = 25,
                      onTapUp: (event) => controller.isHovered2.value = 0,
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          transform: Matrix4.identity()
                            ..rotateY(controller.isHovered2.value / 200 * pi),
                          child: Image.asset(
                            'assets/wheel.png',
                            height: size.height / 2,
                            width: size.width / 2,
                            fit: BoxFit.contain,
                          ))))),
            ])));
  }
}
