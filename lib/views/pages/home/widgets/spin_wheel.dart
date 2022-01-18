import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key, required this.isDesktopView}) : super(key: key);
  final bool isDesktopView;

  @override
  _SpinWheelState createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final controller = Get.find<HomeController>();

  void _showcontent() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.45),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 0),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Wrap(children: [
                        Center(
                          widthFactor: 1.0,
                          child: Text(controller.getContent(),
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                // on press controller.login
                                onPressed: controller.login,
                                child: const Text('Apply'))),
                      ]
                          // Add button right aligned with text apply
                          ),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double m = widget.isDesktopView ? size.width : size.height;
    double r = widget.isDesktopView ? 2.6 : 2.1;
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
                child: GestureDetector(
                    onTap: _showcontent,
                    child: Image.asset('assets/apply_sign.webp',
                        width: m / (2 * r)))),
          ],
        ));
  }
}
