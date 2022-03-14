import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/splash_controller.dart';
import 'package:nittfest/config/app_themes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<SplashController>();
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: AppTheme.bgcolors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Obx(
          () => Center(
              child: AnimatedContainer(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: controller.loaderAnim.value
                          ? AppTheme.logoShade1
                          : AppTheme.logoShade2),
                  duration: const Duration(milliseconds: 200),
                  child: Image.asset(
                    'assets/splash_logo.png',
                    height: 250,
                    color: controller.loaderAnim.value
                        ? const Color(0xFFee2939)
                        : Colors.yellow,
                  ))),
        ));
  }
}
