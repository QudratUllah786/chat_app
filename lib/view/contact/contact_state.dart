import 'package:get/get.dart';

import '../../model/login_model/user_data_model.dart';

class ContactState {
  var count = 0.obs;
  RxList<UserDataModel> contactList = <UserDataModel>[].obs;
}