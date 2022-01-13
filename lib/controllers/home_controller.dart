import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class HomeController extends GetxController {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isHovered = false.obs;
  var isHovered2 = 0.obs;
  Stream<int> onRotate = const Stream.empty();
  ImageProvider bg = const AssetImage('bg1.png');
  void togglePlay() => carController.isActive = !carController.isActive;
  var spinWheelMap = [
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
