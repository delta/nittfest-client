import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final selectedIndex = 1.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged() {
    pageController.animateToPage(selectedIndex.value,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
  }
}
