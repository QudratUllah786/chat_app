import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/model/message_model/msg_content.dart';
import 'package:whatsappofficialclone/view/message/chat/chat_state.dart';

import '../../../resources/store/user_store.dart';


class ChatController extends GetxController{
  ChatController();
  final ChatState chatState = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FocusNode contentFocus = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listner;

  @override
  void onInit() {
    var data = Get.parameters;
    doc_id = data['doc_id']?? "";
    chatState.to_uid.value = data['to_uid']??"";
    chatState.to_avatar.value = data['to_avatar']??"";
    chatState.to_name.value = data['to_name']??"";
    super.onInit();
  }

  @override
  void onReady(){
  var messages =  db.collection('message').doc(doc_id).collection('messageList').withConverter(
     fromFirestore: MsgContent.fromFirestore,
     toFirestore: (MsgContent msgContent , options)=> msgContent.toFirestore()).orderBy("addtime",descending: true);
     chatState.msgContentList.clear();
     listner = messages.snapshots().listen((event) {
       for(var change in event.docChanges){
         switch(change.type){
           case DocumentChangeType.added:
             if(change.doc.data() != null){
               chatState.msgContentList.insert(0, change.doc.data()!);
             }
             break;
           case DocumentChangeType.modified:
             break;
           case DocumentChangeType.removed:
             break;
         }

       }

     },
     onError: (error)=> log('Listen Failed: $error'),

     );


    super.onReady();
  }


  /// send message that stores in database

  sendMessage() async{
    String sendContent = textController.text;
    if(textController.text.isEmpty){
      Get.snackbar('Error', 'message box is empty',
      backgroundGradient: const LinearGradient(colors: [
        Color.fromARGB(255, 176, 106, 231),
        Color.fromARGB(255, 166, 112, 231),
        Color.fromARGB(255, 131, 123, 231),
        Color.fromARGB(255, 104, 132, 231)
      ],
          transform: GradientRotation(90)

      ),
      );
    }
    else{
      final content = MsgContent(
        uid: user_id,
        type: 'text',
        time: Timestamp.now(),
        content: sendContent,
      );
      await db.collection("message").doc(doc_id).collection("messageList").withConverter(
          fromFirestore:MsgContent.fromFirestore ,
          toFirestore:(MsgContent msgContent, options)=> msgContent.toFirestore()).add(content).then((value){
        log('Document Snapshot added with id ${value.id}');
        textController.clear();
        Get.focusScope!.unfocus();
      }).onError((error, stackTrace) {
        log('Failed to add message ${error.toString()}');
      });
      await db.collection('message').doc(doc_id).update({
        'last_msg':sendContent,
        'last_time':Timestamp.now(),
      });
    }

  }


}