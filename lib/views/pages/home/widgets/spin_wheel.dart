import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
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
              constraints: const BoxConstraints(maxWidth: 700),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.45),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Wrap(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.getTitle(),
                          style: GoogleFonts.eagleLake(
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                              shadows: [
                                const Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 20.0,
                                  color: Colors.white38,
                                ),
                              ],
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        controller.getContent(),
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.eagleLake(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            shadows: [
                              const Shadow(
                                offset: Offset(5.0, 5.0),
                                blurRadius: 20.0,
                                color: Colors.white70,
                              ),
                            ],
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ElevatedButton(
                              onPressed: controller.login,
                              child: const Text('Apply'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ElevatedButton(
                              onPressed: Get.back,
                              child: const Text('Close'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
