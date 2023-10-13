import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/model/login_model/user_data_model.dart';
import 'package:whatsappofficialclone/resources/store/user_store.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';

import '../../model/login_model/user_login_model.dart';
import '../../model/message_model/message_model.dart';
import 'contact_state.dart';

class ContactController extends GetxController{

  @override
  void onReady(){
    super.onReady();
    asyncLoadAllData();

  }

  ContactController();
  final ContactState contactState = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  goChat(UserDataModel toUser) async{

    /// if i wants to send message to other people

  var fromMessages =   await db.collection("message").withConverter(
       fromFirestore: MessageModel.fromFirestore,
       toFirestore: (MessageModel message,options)=> message.toFirestore(),
   ).where("from_uid",isEqualTo: token).where("to_uid",isEqualTo: toUser.id).get();

  /// a person who wants to send me messages

  var toMessages = await db.collection('messages').withConverter(
      fromFirestore: MessageModel.fromFirestore, 
      toFirestore: (MessageModel message, options)=> message.toFirestore()
  ).where('to_uid',isEqualTo: token).where('from_uid',isEqualTo: toUser.id).get();
  if(fromMessages.docs.isEmpty && toMessages.docs.isEmpty){
    String profile = await UserStore.to.getProfile();
    UserLoginResponseModel userData = UserLoginResponseModel.fromJson(jsonDecode(profile));
  var messageData =  MessageModel(
      from_uid: userData.accessToken,
      to_uid: toUser.id,
      from_name: userData.displayName,
      to_name: toUser.name,
      from_avatar: toUser.photoUrl,
      to_avatar: userData.photoUrl,
      last_msg: "",
      last_time: Timestamp.now(),
      msg_num: 0,
    );
  db.collection("message").withConverter(
      fromFirestore: MessageModel.fromFirestore,
      toFirestore: (MessageModel message,options)=> message.toFirestore(),
  ).add(messageData).then((value) {
    Get.toNamed('',parameters: {
      "doc_id":value.id,
      "to_uid":toUser.id??"",
      "to_name":toUser.name??"",
      "to_avatar":toUser.photoUrl?? "",

    });
  });
  }
  else{
    if(fromMessages.docs.isNotEmpty){
      Get.toNamed(RouteName.chatRoute,parameters: {
        "doc_id":fromMessages.docs.first.id,
        "to_uid":toUser.id??"",
        "to_name":toUser.name??"",
        "to_avatar":toUser.photoUrl?? "",
      });
    }
    if(toMessages.docs.isNotEmpty){
      Get.toNamed(RouteName.chatRoute,parameters: {
        "doc_id":toMessages.docs.first.id,
        "to_uid":toUser.id??"",
        "to_name":toUser.name??"",
        "to_avatar":toUser.photoUrl?? "",
      });
    }
  }
  }

  asyncLoadAllData() async{
  var userBase =await db.collection('users').where("id",isNotEqualTo:token ).withConverter(
        fromFirestore: UserDataModel.fromFirestore,
        toFirestore: (UserDataModel userDataModel,options)=>userDataModel.toFirestore()
    ).get();

  for(var doc in userBase.docs){
    contactState.contactList.add(doc.data());
    log(doc.toString());
  }

  }


}