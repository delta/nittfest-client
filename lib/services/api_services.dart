import 'package:get/get_connect/connect.dart';
import 'package:nittfest/models/department_response.dart';
import 'package:nittfest/models/events_response.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/constants/api_constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:nittfest/models/scores_response.dart';
import 'package:nittfest/services/storage_services.dart';

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  final headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
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

  Future<DepartmentResponse> getDepartments(String token) async {
    final response = await get(ApiConstants.departments, headers: headers);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return departmentResponseFromJson(response.bodyString!);
    }
  }

  Future<List<EventResponse>> getEvents(StorageServices storage) async {
    final cache = storage.retriveEvents();
    try {
      final response = await get(ApiConstants.events, headers: headers);
      if (response.status.hasError) {
        if (cache == null) {
          return Future.error(response.statusText!);
        } else {
          return eventResponseFromJson(cache);
        }
      } else {
        await storage.storeEvents(response.bodyString!);
        return eventResponseFromJson(response.bodyString!);
      }
    } catch (e) {
      return Future.error('Error events');
    }
  }

  Future<List<ScoresResponse>> getScores(StorageServices storage) async {
    final cache = storage.retriveScores();
    final response = await get(ApiConstants.scores, headers: headers);
    try {
      if (response.status.hasError) {
        if (cache == null) {
          return Future.error(response.statusText!);
        } else {
          return scoresResponseFromMap(cache);
        }
      } else {
        await storage.storeScores(response.bodyString!);
        return scoresResponseFromMap(response.bodyString!);
      }
    } catch (e) {
      return Future.error('Error score');
    }
  }
}
