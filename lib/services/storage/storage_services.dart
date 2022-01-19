import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:nittfest/models/answers_response.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/storage/storage_constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class StorageServices extends GetxService {
  late GetStorage storage;
  String domain = 'OC';

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    seedData();
    return this;
  }

  void seedData() {
    if (storage.read(StorageConstants.name) == null) {
      storage.write(StorageConstants.name, '');
    }
    if (storage.read(StorageConstants.email) == null) {
      storage.write(StorageConstants.email, '');
    }
    if (storage.read(StorageConstants.phonenumber) == null) {
      storage.write(StorageConstants.phonenumber, '');
    }
    if (storage.read(StorageConstants.gender) == null) {
      storage.write(StorageConstants.gender, '');
    }
    if (storage.read(StorageConstants.jwt) == null) {
      storage.write(StorageConstants.jwt, '');
    }
    if (storage.read(StorageConstants.domain) == null) {
      storage.write(StorageConstants.domain, 'OC');
    }
    if (storage.read(StorageConstants.preferences) == null) {
      storage.write(StorageConstants.preferences, false);
    }
  }

  void storeData(ResourceResponse response) {
    storage.write(StorageConstants.name, response.name);
    storage.write(StorageConstants.gender, response.gender);
    storage.write(StorageConstants.phonenumber, response.phoneNumber);
    storage.write(StorageConstants.email, response.email);
    storage.write(StorageConstants.jwt, response.jwt);
  }

  void setDomain(String domain) =>
      storage.write(StorageConstants.domain, domain);
  void storePreferences(bool isFilled) =>
      storage.write(StorageConstants.preferences, isFilled);

  void storeAnswers(List<Answer> answers) {
    storage.write(
        StorageConstants.answer, jsonEncode(AnswerResponse(answers: answers)));
  }

  List<Answer> retriveAnswers() =>
      AnswerResponse.fromJson(jsonDecode(storage.read(StorageConstants.answer)))
          .answers;
  String retriveName() => storage.read(StorageConstants.name);
  String retriveGender() => storage.read(StorageConstants.gender);
  String retrivePhoneNumber() => storage.read(StorageConstants.phonenumber);
  String retriveEmail() => storage.read(StorageConstants.email);
  Future<String> retriveDomain() async =>
      await storage.read(StorageConstants.domain);
  Future<String> retriveJWT() async => await storage.read(StorageConstants.jwt);
  Future<bool> retrivePreferences() async =>
      await storage.read(StorageConstants.preferences);
}
