import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/resources/components/round_button.dart';
import 'package:whatsappofficialclone/utils/utils.dart';
import 'package:whatsappofficialclone/view-model/auth-view-model/auth_view_model.dart';
class LoginScreen extends StatefulWidget {

   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
   AuthViewModel authViewModel = Get.put(AuthViewModel());
   void sendPhoneNumber(){
     String phoneNumber = phoneController.text.trim();
     if(authViewModel.phoneCode.isNotEmpty && phoneNumber.isNotEmpty){
       authViewModel.signInWithPhone('${authViewModel.phoneCode}$phoneNumber');
     }
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        centerTitle: true,
        elevation: 0,
        title: Text('enter_phone_no'.tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text('whats app verify'.tr),
              20.h.ph,
              TextButton(onPressed: (){
                authViewModel.pickCountry(context);
              }, child: const Text('Pick Country')),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Obx(() => Text('+${authViewModel.phoneCode.value}')),
                  10.w.pw,
                  SizedBox(
                    width: context.mediaWidth*0.7,
                    child:  TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.white
                            )
                        ),
                        enabled: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.white
                          )
                        ),
                        hintStyle:  TextStyle(
                          color: AppColor.white
                        ),
                        hintText: 'Phone Number'
                      )
                    ),
                  )
                ],
              ),
              Spacer(),
              RoundButton(
                backGroundColor: AppColor.onboardingThirdColor,
    color: AppColor.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                width: 0.25, height: 0.06, txt: 'Next', onTap: sendPhoneNumber,
                radius: 20,
              )
            ],
          ),
      ),

    );
  }
}

