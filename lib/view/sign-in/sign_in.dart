import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';
import 'package:whatsappofficialclone/utils/utils.dart';
import 'package:whatsappofficialclone/view/sign-in/index.dart';

import '../../resources/assets/asset_images.dart';
import '../../resources/components/round_button.dart';
import '../../resources/values/shadow.dart';
class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _logo(){
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
             width: 76.w,
              height: 76.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(child: Container(
                    width: 76.w,
                    decoration: BoxDecoration(
                      color: AppColor.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),

                  )),
                   Positioned(child: Align(
                     alignment: Alignment.center,
                     child: Icon(Icons.chat_bubble_rounded,size: 50.sp,
                     color: AppColor.white,),
                   )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h,bottom: 15.h),
              child: Text(
                'Let\'s Chat',
                style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),

      );

    }

    Widget _thirdPartyLogin(){
      return Container(
        margin: EdgeInsets.only(bottom: 250.h),
        width: 295.w,
        child: Column(
         children: [
           Text('Sign in with social networks',
           style: TextStyle(
             color: AppColor.blackColor,
             fontSize: 16.sp,
             fontWeight: FontWeight.w400,
           ),),
           40.h.ph,
           RoundButton(
             backGroundColor: AppColor.primaryBackground,
               width: 0.5,
               height: 0.1,
               txt: 'Google Login',
               onTap: () async{
              await controller.handleLogin().then((value) {
                Get.offAndToNamed(RouteName.applicationRoute);
              });
               },
               radius: 20,
               fontSize: 15.sp,
               fontWeight: FontWeight.w500,
               color: AppColor.white,
           )
         ],
        ),
      );
    }


   return Scaffold(
     backgroundColor: AppColor.white,
     body: Center(
       child: Column(
         children: [
           _logo(),
           Spacer(),
           _thirdPartyLogin(),

         ],
       ),
     ),
   );
  }
}
