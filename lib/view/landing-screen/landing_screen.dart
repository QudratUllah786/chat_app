import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/assets/asset_images.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/resources/components/round_button.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';
import 'package:whatsappofficialclone/utils/utils.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              40.h.ph,
              Text('welcome'.tr,
                style: const TextStyle(
                color: AppColor.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
              ),),
              50.h.ph,
              Image.asset(AssetImages.bgImage,width: 320.w,height: 320.h,
              color: AppColor.tealGreenDark,),
              80.h.ph,
              RichText(
                textAlign: TextAlign.center,
                  text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Read our Privacy Policy Tap',
                    style: TextStyle(
                      color: AppColor.greyColor
                    )
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap= (){
                    },
                    text: ' \'Agree and Continue\'  to\n',
                      style: const TextStyle(
                          color: AppColor.greyColor
                      )
                  ),
                  const TextSpan(
                    text: 'accept the Term of Services',
                      style: TextStyle(
                          color: AppColor.greyColor
                      )
                  )
                ]
              )),
              20.h.ph,
                RoundButton(
                  backGroundColor: AppColor.onboardingThirdColor,
                  color: AppColor.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  radius: 20,
                 onTap: (){
                   Get.toNamed(RouteName.loginRoute);
                 },
                   width: 0.8,
                   height: 0.07,
                   txt: 'AGREE AND CONTINUE',

               )

            ],
          ),
        ),
      ),
    );
  }
}
