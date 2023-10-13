import 'package:get/get.dart';
import 'package:whatsappofficialclone/view/sign-in/index.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }

}