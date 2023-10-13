import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsappofficialclone/resources/components/round_button.dart';
import 'package:whatsappofficialclone/utils/utils.dart';

import '../../resources/assets/asset_images.dart';
import '../../resources/color/color.dart';
import '../../utils/routes/name_routes.dart';
class ThirdPage extends StatelessWidget {

  ThirdPage({Key? key,required this.onPressed}) : super(key: key);
 VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            150.h.ph,
            const Image(image:
            AssetImage(AssetImages.cloudImage)),
            20.h.ph,
            Text('CLOUD STORAGE',style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Text('Lorem ipsum dolor sit\n amet, adipiscing elit.',textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            200.h.ph,
         RoundButton(
             backGroundColor: AppColor.onboardingThirdColor,
           color: AppColor.white,
           fontWeight: FontWeight.w600,
             fontSize: 20.sp,
             width:0.8,
             height: 0.075,
             txt: 'Login',
             radius: 30,
             onTap: onPressed
         )
              ],
            )
        ),
      );
  }
}
