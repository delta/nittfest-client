import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nittfest/constants/screen_constants.dart';
import 'package:nittfest/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xAA121212),
          body: PageView(
            controller: controller.pageController,
            children: widgetItems,
            physics: const NeverScrollableScrollPhysics(),
          ),
          bottomNavigationBar: Obx(() => CurvedNavigationBar(
              items: iconItems
                  .asMap()
                  .map((index, image) => MapEntry(
                      index,
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.asset(image,
                              height: 24,
                              color: controller.selectedIndex.value != index
                                  ? Colors.white
                                  : Colors.black))))
                  .values
                  .toList(),
              color: const Color(0xF1121222),
              backgroundColor: const Color(0xF1121222),
              buttonBackgroundColor: const Color.fromARGB(255, 249, 167, 20),
              index: controller.selectedIndex.value,
              height: 50,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                controller.selectedIndex.value = index;
                controller.onPageChanged();
              }))));
}
