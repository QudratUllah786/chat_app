import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsappofficialclone/resources/store/user_store.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';
import 'package:whatsappofficialclone/utils/routes/routes.dart';
import 'package:whatsappofficialclone/utils/utils.dart';
import 'package:whatsappofficialclone/view/sign-in/state.dart';

import '../../model/login_model/user_data_model.dart';
import '../../model/login_model/user_login_model.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'openid'
    ]
);
class SignInController extends GetxController{
 SignInController();
  final state = SignInState();
  final db = FirebaseFirestore.instance;


 Future<void> handleLogin() async{
   try{
     var user = await _googleSignIn.signIn();

     if(user!= null){

       final _googleAuth = await user.authentication;
       final _credential = GoogleAuthProvider.credential(
         accessToken:_googleAuth.accessToken,
         idToken: _googleAuth.idToken,
       );
       await FirebaseAuth.instance.signInWithCredential(_credential);
           String displayName = user.displayName ?? user.email;
       String email = user.email;
       String id = user.id;
       String photoUrl = user.photoUrl?? "";
      UserLoginResponseModel userProfile =  UserLoginResponseModel();
      userProfile.displayName = displayName;
      userProfile.email = email;
      userProfile.photoUrl = photoUrl;
      userProfile.accessToken = id;

      UserStore.to.saveProfile(userProfile);
      var userBase = await db.collection("users").withConverter(
          fromFirestore: UserDataModel.fromFirestore,
          toFirestore: (UserDataModel userDataModel,options)=> userDataModel.toFirestore(),
      ).where("id",isEqualTo: id).get();

      if(userBase.docs.isEmpty){
        final data = UserDataModel(
          id:id,
          name: displayName,
          email: email,
          location: "",
          fcmToken: "",
          addTime: Timestamp.now(),
          photoUrl: photoUrl,
        );
        await db.collection("users").withConverter(
          fromFirestore: UserDataModel.fromFirestore,
          toFirestore: (UserDataModel userDataModel,options)=> userDataModel.toFirestore(),
        ).add(data).then((value) {
          Utils.toastMessage('login Successfully');
          Get.offAndToNamed(RouteName.applicationRoute);
        });
      }
     }
   }catch(e){
      Utils.toastMessage('Login Error');
      log(e.toString());
     
       }
  }

  @override
  void onReady(){
   super.onReady();
   FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if(user == null){
       log('User is logged out');
     }
     else{
       log('User is log in');
     }
   });
  }

}