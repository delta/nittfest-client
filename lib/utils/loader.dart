import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/loader_controller.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoaderController());
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black26,
            Color.fromRGBO(100, 40, 60, 1.0),
            Colors.black54,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Obx(
          () => Center(
              child: AnimatedContainer(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: controller.loaderAnim.value
                          ? [
                              const BoxShadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 40.0,
                                  color: Color(0x66F72119))
                            ]
                          : [
                              const BoxShadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 40.0,
                                  color: Color(0x55FFC42E))
                            ]),
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/nflogo.png',
                    height: 350,
                    color: controller.loaderAnim.value
                        ? const Color(0xFFee2939)
                        : Colors.yellow,
                  ))),
        ));
  }
}
