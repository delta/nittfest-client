import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({Key? key, required this.isDesktopView}) : super(key: key);
  final bool isDesktopView;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    double m = isDesktopView ? size.width : size.height;
    double r = isDesktopView ? 3.5 : 2;
    return SizedBox(
        height: m / r,
        width: m / r,
        child: Stack(
          children: [
            Center(
                child: Obx(() => Transform.rotate(
                    angle: controller.startAngle.value,
                    child: GestureDetector(
                        onPanDown: (details) {
                          controller.currentPointer = details.localPosition;
                          controller.center = Offset(m / (2 * r), m / (2 * r));
                        },
                        onPanUpdate: controller.updateStartAngle,
                        onPanEnd: (details) => controller.adjust(),
                        child: Image.asset(
                          'assets/carouselbg.webp',
                        ))))),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: m / (2 * r),
                child: Center(
                    child: Image.asset(
                  'assets/indicator.png',
                  height: m / (2 * r),
                ))),
            Center(
                child: IconButton(
                    onPressed: controller.login,
                    iconSize: m / (2 * r),
                    icon: Image.asset('assets/apply_sign.webp')))
          ],
        ));
  }
}
