import 'package:get/get.dart';
import 'package:whatsappofficialclone/model/message_model/msg_content.dart';


class ChatState{
  RxList<MsgContent> msgContentList = <MsgContent>[].obs;

  var to_uid = "".obs;
  var to_name = "".obs;
  var to_avatar = "".obs;
  var to_location = "unknown".obs;


}