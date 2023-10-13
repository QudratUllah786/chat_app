import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:whatsappofficialclone/resources/store/user_store.dart';

import '../../utils/routes/name_routes.dart';
import 'state.dart';

class WelcomeController extends GetxController{
  WelcomeController();
 WelcomeState welcomeState = WelcomeState();
 void increment(int index) async{
   welcomeState.index.value = index;
 }
 handleSignIn() async {
   await UserStore.to.saveAlreadyOpen();
   Get.offAndToNamed(RouteName.signInRoute);
 }
}