import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/themes/app_themes.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var map = [
      {
        'name': 'OC',
        'color': const Color(0xFF9D34E6),
        'icon': Icons.group_rounded
      },
      {
        'name': 'CONTENT',
        'color': const Color(0xFF911DB0),
        'icon': Icons.book_rounded
      },
      {
        'name': 'DESIGN',
        'color': const Color(0xFF9D34E6),
        'icon': Icons.design_services_rounded
      },
      {
        'name': 'EVENTS',
        'color': const Color(0xFF911DB0),
        'icon': Icons.event_rounded
      },
      {
        'name': 'AV',
        'color': const Color(0xFF9D34E6),
        'icons': Icons.video_collection_rounded
      },
      {
        'name': 'AMBIENCE',
        'color': const Color(0xFF911DB0),
        'icon': Icons.architecture_rounded
      }
    ];
    var controller = Get.find<InductionsController>();
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
                selected: controller.onRotate,
                items: map
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
