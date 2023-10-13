import 'package:flutter/foundation.dart';

class UserLoginResponseModel{
  String? accessToken;
  String? displayName;
  String? email;
  String? photoUrl;
  UserLoginResponseModel({
    this.photoUrl,
    this.email,
    this.displayName,
    this.accessToken,
  });
  factory UserLoginResponseModel.fromJson(Map<String,dynamic>json)=>
      UserLoginResponseModel(
        accessToken: json['access_token'],
        displayName: json['display_name'],
        email: json['email'],
        photoUrl: json['photoUrl']
      );
  Map<String,dynamic> toJson() =>{
    "access_token":accessToken,
    "display_name":displayName,
    "email":email,
    "photoUrl":photoUrl,
  };
}