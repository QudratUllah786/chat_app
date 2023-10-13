import 'dart:convert';

import 'package:get/get.dart';
import '../../model/login_model/user_login_model.dart';
import '../services/storage_service.dart';
import '../values/storage.dart';

class UserStore extends GetxController{


  static UserStore get to => Get.find();

  final _isLogin = false.obs;

  String token = '';
  bool get isLogin => _isLogin.value;

  final _profile = UserLoginResponseModel().obs;

  bool get hasToken => token.isNotEmpty;

@override

void onInit(){

  token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
  var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  if(profileOffline.isNotEmpty){
    _isLogin.value = true;
    _profile(UserLoginResponseModel.fromJson(jsonDecode(profileOffline)));

  }

  super.onInit();
}


Future<bool> saveAlreadyOpen(){
return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
}
Future<void> setToken(String value) async{
await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
token = value;
}

Future<String> getProfile() async{
  if(token.isEmpty) {
    return "";
  }
  return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
}




Future<void> saveProfile(UserLoginResponseModel profile) async{
  _isLogin.value = true;
  StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  setToken(profile.accessToken!);
}
Future<void> onLogout() async{
 // await StorageService.to.
}

}