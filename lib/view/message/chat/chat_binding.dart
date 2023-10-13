import 'package:get/get.dart';

import 'chart_controller.dart';

class ChatBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }

}