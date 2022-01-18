import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoaderController extends GetxController {
  late Timer loaderTimer;
  var loaderAnim = false.obs;

  @override
  void onInit() {
    loaderTimer = Timer.periodic(const Duration(milliseconds: 800),
        (timer) => loaderAnim.value = !loaderAnim.value);
    super.onInit();
  }

  @override
  void onClose() {
    loaderTimer.cancel();
    super.onClose();
  }
}
