import 'package:get/get_connect/connect.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/api/api_constants.dart';

class ApiManager extends GetConnect {
  Future<ResourceResponse> getCallBack(String code) async {
    final response = await get('${ApiConstants.auth}?code=$code', headers: {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
    });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return resourceResponseFromJson(response.bodyString!);
    }
  }
}
