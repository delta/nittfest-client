import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:nittfest/models/answers_response.dart';
import 'package:nittfest/models/preference_model.dart';
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

  Future<String> postFormAnswers(AnswerResponse answers, String jwt) async {
    var headers2 = {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
      'Authorization': 'Bearer $jwt'
    };
    final response = await post(ApiConstants.formAnswers, answers.toJson(),
        headers: headers2);

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
      'Authorization': 'Bearer $jwt'
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

  Future<bool> isPrefrencesFilled(String jwt) async {
    var headers2 = {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
      'Authorization': 'Bearer $jwt'
    };
    final response = await get(ApiConstants.preferences, headers: headers2);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return json.decode(response.bodyString!)['status'] as bool;
    }
  }

  Future<String> postPreference(String jwt, Preferences preferences) async {
    var headers2 = {
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': 'Accept',
      'Authorization': 'Bearer $jwt'
    };
    final response = await post(
        ApiConstants.preferences, preferencesToJson(preferences),
        headers: headers2);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.bodyString!;
    }
  }
}
