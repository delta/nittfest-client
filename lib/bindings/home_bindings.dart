import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/about_controller.dart';
import 'package:nittfest/controllers/dashboard_controller.dart';
import 'package:nittfest/controllers/events_controller.dart';
import 'package:nittfest/controllers/home_controller.dart';
import 'package:nittfest/controllers/scores_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(EventController());
    Get.put(ScoresController());
    Get.put(DashboardController());
    Get.put(DepartmentController());
  }
}
