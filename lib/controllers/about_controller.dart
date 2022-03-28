import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nittfest/models/department_response.dart';
import 'package:nittfest/services/api_services.dart';
import 'package:nittfest/services/storage_services.dart';

class DepartmentController extends GetxController
    with StateMixin<DepartmentResponse> {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  @override
  void onReady() {
    getDepartments();
    super.onReady();
  }

  void getDepartments() {
    api.getDepartments(storage).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.empty());
    });
  }

  void snackResponse(String header, String message) {
    Get.snackbar(header, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundGradient: const LinearGradient(
          colors: [
            Color.fromARGB(240, 255, 180, 10),
            Color.fromARGB(220, 255, 100, 20)
          ],
        ),
        colorText: Colors.white);
  }
}
