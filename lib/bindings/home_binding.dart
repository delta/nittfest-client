import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/events_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EventsController());
  }
}
