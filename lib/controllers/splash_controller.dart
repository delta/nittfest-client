import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:nittfest/services/storage/storage_services.dart';
import 'package:nittfest/constants/navigation_routes.dart';

class SplashController extends GetxController {
  final storage = Get.find<StorageServices>();
  late Timer loaderTimer;
  late Timer splashTimer;
  final loaderAnim = false.obs;

  @override
  void onInit() {
    String? token = storage.retriveJWT();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loaderTimer = Timer.periodic(const Duration(milliseconds: 600),
          (timer) => loaderAnim.value = !loaderAnim.value);
      splashTimer = Timer(const Duration(milliseconds: 3000), () {
        String route = NavigationRoutes.authRoute;
        if (token != null) {
          route = NavigationRoutes.gameRoute;
        }
        Get.offAndToNamed(route);
      });
    });
    super.onInit();
  }

  @override
  void onClose() {
    loaderTimer.cancel();
    splashTimer.cancel();
    super.onClose();
  }
}
