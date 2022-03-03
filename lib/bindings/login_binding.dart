import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/loader_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoaderController());
  }
}
