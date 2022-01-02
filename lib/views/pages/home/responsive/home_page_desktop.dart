import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:nittfest/views/pages/home/widgets/register_button.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InductionsController>();
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          right: 1,
          top: 50,
          child: Obx(() => MouseRegion(
              onEnter: (event) => controller.isHovered.value = true,
              onExit: (event) => controller.isHovered.value = false,
              child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: controller.isHovered.value
                      ? size.width / 5
                      : size.width / 6,
                  height: controller.isHovered.value
                      ? size.height / 5
                      : size.height / 6,
                  child: Image.asset(
                    'assets/baloon.png',
                    fit: BoxFit.fitHeight,
                  ))))),
      Positioned(
          left: 80,
          top: 150,
          child: SizedBox(
              width: size.width / 2.25,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo_nf.png',
                    color: Colors.white,
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'INDUCTIONS',
                    style: GoogleFonts.poppins(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 8,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'The Battle Of Departments',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 45),
                  const RegisterButton(buttonSize: 18)
                ],
              )))),
      Positioned(
          right: 10,
          bottom: -10,
          child: Obx(() => MouseRegion(
              onEnter: (event) => controller.isHovered2.value = 25,
              onExit: (event) => controller.isHovered2.value = 0,
              child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  transform: Matrix4.identity()
                    ..rotateY(controller.isHovered2.value / 225 * pi),
                  child: Image.asset(
                    'assets/wheel.png',
                    height: size.height / 1.5,
                    width: size.width / 2,
                    fit: BoxFit.fitHeight,
                  )))))
    ]);
  }
}
