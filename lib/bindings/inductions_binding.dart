import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/inductions_controller.dart';

class InductionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InductionsController());
  }
}
