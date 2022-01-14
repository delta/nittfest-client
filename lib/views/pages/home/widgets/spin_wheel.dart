import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    return MouseRegion(
        onEnter: (event) => controller.isHovered2.value = 5,
        onExit: (event) => controller.isHovered2.value = 0,
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurStyle: BlurStyle.solid,
                  color: Colors.black.withOpacity(0.3)),
              BoxShadow(
                  blurStyle: BlurStyle.solid,
                  color: const Color(0xFFEEC20F).withOpacity(0.25))
            ], shape: BoxShape.circle),
            width: size.width / 1.8,
            height: size.height / 1.8,
            padding: const EdgeInsets.all(10),
            child: FortuneWheel(
                onFling: () {},
                indicators: [
                  FortuneIndicator(
                    child: SizedBox(
                        width: 90,
                        child: Image.asset('assets/roulettecenter.png')),
                  ),
                ],
                items: controller.spinWheelMap
                    .map((value) => FortuneItem(
                        child: Text(
                          value['name'].toString(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              letterSpacing: 2,
                              shadows: AppTheme.shadows,
                              color: Colors.white),
                        ),
                        style: FortuneItemStyle(
                          color: value['color'] as Color,
                          borderColor: const Color(0xFFEEC20F),
                          borderWidth: 5.5,
                        )))
                    .toList())));
  }
}
