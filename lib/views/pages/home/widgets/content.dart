import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/controllers/home_controller.dart';

class Content extends StatelessWidget {
  final double headerSize;
  final double logoSize;
  final double bodySize;
  final double bodySize2;
  final double gapSize;
  final double gapSize2;
  final bool isDesktop;
  final MainAxisAlignment mainAxisAlignment;
  const Content(
      {Key? key,
      required this.headerSize,
      required this.logoSize,
      required this.bodySize,
      required this.bodySize2,
      required this.mainAxisAlignment,
      required this.isDesktop,
      this.gapSize = 0,
      this.gapSize2 = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    controller.textSize.value = 1;
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: gapSize),
        Obx(() => Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: controller.headerAnim.value
                    ? [
                        const BoxShadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 90.0,
                            color: Color(0x90F72119))
                      ]
                    : [
                        const BoxShadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 90.0,
                            color: Color(0x94FFC42E))
                      ]),
            child: Image.asset(
              'assets/nflogo.png',
              height: logoSize,
              color: controller.headerAnim.value
                  ? const Color(0xFFee2939)
                  : const Color(0xFFD4AF37),
            ))),
        Obx(() => Text(
              'INDUCTIONS',
              style: GoogleFonts.hanalei(
                  fontSize: headerSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6,
                  shadows: controller.headerAnim.value
                      ? [
                          const Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 20.0,
                            color: Color(0xFFF72119),
                          ),
                        ]
                      : [
                          const Shadow(
                            offset: Offset(0.0, 0.0),
                            blurRadius: 20.0,
                            color: Color(0xFFFFC42E),
                          ),
                        ],
                  color: controller.headerAnim.value
                      ? const Color(0xFFee2939)
                      : const Color(0xFFD4AF37)),
            )),
        SizedBox(height: gapSize),
        isDesktop
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
                child: Text(
                  'NITTFEST is an inter-department cultural extravaganza wherein the students showcase their talents in a multitude of events, all in effort to make their department the best of the best. With the glory of the department on the line, this fest is a celebration of arts and talents as engineering students prove their adeptness in the cultural world with their own music, dance, language and theatrics.',
                  style: GoogleFonts.eagleLake(
                      fontWeight: FontWeight.bold,
                      fontSize: bodySize2,
                      shadows: [
                        const Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 20.0,
                          color: Color(0xFFFFC42E),
                        ),
                      ],
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ))
            : Obx(() => AnimatedScale(
                duration: const Duration(milliseconds: 800),
                scale: controller.textSize.value,
                child: Text.rich(TextSpan(
                    text: 'APPLY FOR ',
                    style: GoogleFonts.eagleLake(
                        fontWeight: FontWeight.bold,
                        fontSize: bodySize2,
                        shadows: [
                          const Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 20.0,
                            color: Colors.black45,
                          ),
                        ],
                        color: Colors.white),
                    children: [
                      TextSpan(
                          text: controller.choosenTeam.value,
                          style: GoogleFonts.eagleLake(
                              fontWeight: FontWeight.bold,
                              fontSize: bodySize2,
                              shadows: [
                                const Shadow(
                                  offset: Offset(5.0, 5.0),
                                  blurRadius: 20.0,
                                  color: Color(0xFFFFC42E),
                                ),
                              ],
                              color: const Color(0xFFD4AF37)))
                    ])))),
      ],
    );
  }
}
