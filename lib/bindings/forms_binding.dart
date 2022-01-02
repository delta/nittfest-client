import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/forms_controller.dart';

class FormsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FormsController());
  }
}
