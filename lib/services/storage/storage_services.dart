import 'package:get_storage/get_storage.dart';
import 'package:nittfest/services/storage/storage_constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<String> retriveName() async =>
      await storage.read(StorageConstants.name);
  Future<String> retriveGender() async =>
      await storage.read(StorageConstants.gender);
  Future<String> retrivePhoneNumber() async =>
      await storage.read(StorageConstants.phonenumber);
  Future<String> retriveEmail() async =>
      await storage.read(StorageConstants.email);
  Future<String> retriveJWT() async => await storage.read(StorageConstants.jwt);
}
