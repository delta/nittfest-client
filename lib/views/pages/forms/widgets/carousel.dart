import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/controllers/forms_controller.dart';

class Carousel extends StatelessWidget {
  final List<Widget> children;

  const Carousel({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormsController controller = Get.find<FormsController>();
    return CarouselSlider(
      carouselController: controller.buttonCarouselController,
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: false,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
          onPageChanged: (index, reason) {
            if (reason.name == 'controller') {
              controller.pageNumber.value = index + 1;
            }
          }),
      items: children,
    );
  }
}
