import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/forms_controller.dart';
import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel_navigator.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class FormsPageDesktop extends StatelessWidget {
  const FormsPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FormsController>();
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Positioned(
          top: 20,
          left: 50,
          child: Image.asset(
            'assets/logo_nf.png',
            color: AppTheme.bodycolor,
            width: 45,
          )),
      Carousel(
        children: controller.content
            .asMap()
            .map((i, value) => MapEntry(
                i,
                Center(
                    child: SizedBox(
                        width: 2000,
                        height: size.height,
                        child: CardContent(
                            index: (i + 1).toString(), value: value)))))
            .values
            .toList(),
      ),
      const Positioned(bottom: 10, right: 10, child: CarouselNavigator())
    ]);
  }
}
