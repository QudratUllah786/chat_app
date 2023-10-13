import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/services/storage_service.dart';

import '../values/storage.dart';

class ConfigStore extends GetxController{
  static ConfigStore get to => Get.find();
  bool isFirstOpen = false;

  @override
  Future<void> onInit() async {
    isFirstOpen = await StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    super.onInit();
  }

  Future<bool>  saveAlreadyOpen(){
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY,true);
  }
}