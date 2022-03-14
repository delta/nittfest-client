import 'package:nittfest/services/api/api_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}
