import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/forms_controller.dart';

class CarouselNavigator extends StatelessWidget {
  const CarouselNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormsController controller = Get.find<FormsController>();
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(children: [
          IconButton(
              onPressed: controller.buttonCarouselController.previousPage,
              icon: const Icon(
                Icons.keyboard_arrow_up,
                color: Colors.pink,
              )),
          IconButton(
              onPressed: controller.buttonCarouselController.nextPage,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.pink)),
        ]));
  }
}
