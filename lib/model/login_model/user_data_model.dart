import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel{
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmToken;
  final Timestamp? addTime;

  UserDataModel({
   this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.location,
    this.fcmToken,
    this.addTime,
});

  factory UserDataModel.fromFirestore(
      /// from firestore which is similar to fromJson
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options,
      ){
    final data = snapshot.data();
    return UserDataModel(
      id: data?['id'],
      name: data?['name'],
      email: data?['email'],
      photoUrl: data?['photoUrl'],
      addTime: data?['addTime'],
      fcmToken: data?['fcmToken'],
      location: data?['location'],
    );
  }
  Map<String,dynamic> toFirestore(){  /// toFirestore which is similar to toJson
    return {
      if(id!= null ) "id":id,
      if(name!= null ) "name":name,
      if(email!= null ) "email":email,
      if(photoUrl!= null ) "photoUrl":photoUrl,
      if(fcmToken!= null ) "fcmToken":fcmToken,
      if(location!= null ) "location":location,
      if(addTime!= null)"addTime":addTime,
    };
  }

}