import 'package:get_storage/get_storage.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/storage/storage_constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    seedData();
    return this;
  }

  void seedData() {
    storage.write(StorageConstants.name, '');
    storage.write(StorageConstants.gender, '');
    storage.write(StorageConstants.phonenumber, '');
    storage.write(StorageConstants.email, '');
    storage.write(StorageConstants.jwt, '');
  }

  void storeData(ResourceResponse response) {
    storage.write(StorageConstants.name, response.name);
    storage.write(StorageConstants.gender, response.gender);
    storage.write(StorageConstants.phonenumber, response.phoneNumber);
    storage.write(StorageConstants.email, response.email);
    storage.write(StorageConstants.jwt, response.jwt);
  }

  String retriveName() => storage.read(StorageConstants.name);
  String retriveGender() => storage.read(StorageConstants.gender);
  String retrivePhoneNumber() => storage.read(StorageConstants.phonenumber);
  String retriveEmail() => storage.read(StorageConstants.email);
  String retriveJWT() => storage.read(StorageConstants.jwt);
}
