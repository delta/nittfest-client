import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:nittfest/models/questions_response.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/api/api_constants.dart';

class ApiManager extends GetConnect {
  var headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': 'Accept',
  };
  Future<ResourceResponse> getCallBack(String code) async {
    final response =
        await get('${ApiConstants.auth}?code=$code', headers: headers);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return resourceResponseFromJson(response.bodyString!);
    }
  }

  Future<String> getDescription(String domain) async {
    final response = await get('${ApiConstants.description}?domain=$domain',
        headers: headers);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.bodyString!;
    }
  }

  Future<QuestionResponse> getFormQuestions(String domain, String jwt) async {
    var body = json.encode({'domain': domain});
    var headers2 = {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
      'Authorization': jwt
    };
    final response = await post(
      ApiConstants.formQuestions,
      body,
      headers: headers2,
    );

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return questionResponseFromJson(response.bodyString!);
    }
  }
}
