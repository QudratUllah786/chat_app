import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';
import 'package:whatsappofficialclone/utils/utils.dart';

class AuthRepository{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
});
  void signInWithPhone(String phoneNumber) async{
    try{
      await  auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential)async{
          await auth.signInWithCredential(credential);
          },
          verificationFailed: (e){
          throw Exception(e.message);
          },
          codeSent: ((String verificationId, int ? resendToken) async{
            Get.toNamed(RouteName.otpRoute,arguments: verificationId);
          }),
          codeAutoRetrievalTimeout: ((String verificationId){

          })
      );

    } on FirebaseAuthException catch (e){
      Utils.snackBar(e.message!);
    }
  }
}