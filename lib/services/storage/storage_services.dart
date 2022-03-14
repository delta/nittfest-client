import 'package:get_storage/get_storage.dart';
import 'package:nittfest/models/resource_response.dart';
import 'package:nittfest/services/storage/storage_constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class StorageServices extends GetxService {
  late GetStorage storage;

  Future<StorageServices> initStorage() async {
    await GetStorage.init();
    storage = GetStorage();
    return this;
  }

  Future<void> storeData(ResourceResponse response) async {
    await storage.write(StorageConstants.name, response.name);
    await storage.write(StorageConstants.email, response.email);
    await storage.write(StorageConstants.jwt, response.jwt);
  }

  String? retriveName() => storage.read(StorageConstants.name);
  String? retriveEmail() => storage.read(StorageConstants.email);
  String? retriveJWT() => storage.read(StorageConstants.jwt);
}
