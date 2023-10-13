import 'package:cloud_firestore/cloud_firestore.dart';

class MsgContent{
  final String? uid;
  final String? content;
  final String? type;
  final Timestamp? time;



  MsgContent({
    this.uid,
    this.content,
    this.time,
    this.type,
});

  factory MsgContent.fromFirestore(DocumentSnapshot<Map<String,dynamic>> snapshot,SnapshotOptions? options){
    final data = snapshot.data();
    return MsgContent(
      uid: data?['uid'],
      content: data?['content'],
      time: data?['time'],
      type: data?['type']
    );
  }
  Map<String,dynamic> toFirestore(){
    return{
      if(uid != null)"uid":uid,
      if(content!= null)"content":content,
      if(time != null)"time":time,
      if(type!= null)"type":type,
    };
  }
}