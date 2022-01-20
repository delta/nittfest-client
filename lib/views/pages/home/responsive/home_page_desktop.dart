import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/spin_wheel.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.find<HomeController>();
    return Stack(children: [
      Row(children: [
        Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Content(
            mainAxisAlignment: MainAxisAlignment.center,
            logoSize: (270.0 / 1848) * size.width,
            headerSize: (90 / 1848) * size.width,
            bodySize: (36.0 / 1848) * size.width,
            bodySize2: (22.0 / 1848) * size.width,
            gapSize: (20 / 980) * size.height,
            isDesktop: true,
            gapSize2: (40 / 980) * size.height,
          ),
          SizedBox(height: (40 / 980) * size.height),
        ])),
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
              const Center(
                  child: SpinWheel(
                isDesktopView: true,
              )),
              Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.topCenter,
                  child: Obx(() => AnimatedScale(
                      duration: const Duration(milliseconds: 800),
                      scale: controller.textSize.value,
                      child: Text.rich(TextSpan(
                          text: 'APPLY FOR ',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: (40.0 / 1848) * size.width,
                              shadows: const [
                                Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 20.0,
                                  color: Colors.white70,
                                ),
                              ],
                              color: Colors.white),
                          children: [
                            TextSpan(
                                text: controller.choosenTeam.value,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: (40.0 / 1848) * size.width,
                                    shadows: const [
                                      Shadow(
                                        offset: Offset(5.0, 5.0),
                                        blurRadius: 20.0,
                                        color: Color(0xFFFFC42E),
                                      ),
                                    ],
                                    color: const Color(0xFFD4AF37)))
                          ]))))),
            ])),
      ]),
      const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
              child: Footer(
            size: 20,
          ))),
    ]);
  }
}
