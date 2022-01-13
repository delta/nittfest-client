import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/forms_controller.dart';
import 'package:nittfest/views/pages/forms/widgets/card_content.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel.dart';
import 'package:nittfest/views/pages/forms/widgets/carousel_navigator.dart';

class FormsPagePhone extends StatelessWidget {
  const FormsPagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FormsController>();

    return Stack(children: [
      Positioned(
          top: 10,
          left: 10,
          child: Image.asset(
            'assets/logo_nf.png',
            color: Colors.white,
            width: 25,
          )),
      Carousel(
        children: controller.content
            .asMap()
            .map((i, value) => MapEntry(
                i, CardContent(index: (i + 1).toString(), value: value)))
            .values
            .toList(),
      ),
      const Positioned(bottom: 10, right: 10, child: CarouselNavigator())
    ]);
  }
}
