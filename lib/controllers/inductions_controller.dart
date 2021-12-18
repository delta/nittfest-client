import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rive/rive.dart';

class InductionsController extends GetxController {
  late RiveAnimationController carController;
  late RiveAnimationController flyingcarController;
  var isPlaying = false.obs;
  void togglePlay() => carController.isActive = !carController.isActive;

  @override
  void onInit() {
    carController = SimpleAnimation('driwing');
    flyingcarController = SimpleAnimation('Animation');
    super.onInit();
  }
}
