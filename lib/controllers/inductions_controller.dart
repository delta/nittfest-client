import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class InductionsController extends GetxController {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  Stream<int> onRotate = const Stream.empty();
  ImageProvider bg = const AssetImage('bg1.png');
  void togglePlay() => carController.isActive = !carController.isActive;

  @override
  void onInit() {
    carController = SimpleAnimation('driwing');
    flyingcarController = SimpleAnimation('Animation');
    super.onInit();
    onRotate.listen((p0) {
      log(p0.toString());
    });
  }
}
