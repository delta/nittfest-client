import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:rive/rive.dart';

class FormsController extends GetxController {
  var isPlaying = false.obs;
  late CarouselController buttonCarouselController;
  late SMINumber growInput;

  @override
  void onInit() {
    buttonCarouselController = CarouselController();
    super.onInit();
  }
}
