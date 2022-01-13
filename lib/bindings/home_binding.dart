import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
