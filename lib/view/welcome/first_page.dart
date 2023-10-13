import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsappofficialclone/utils/utils.dart';

import '../../resources/assets/asset_images.dart';
import '../../resources/color/color.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            150.h.ph,
            Image(image:
            AssetImage(AssetImages.chatImage)),
            20.h.ph,
            Text('EASYCHAT',style: TextStyle(
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
            Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             TextButton(onPressed: (){}, child: Text('SKIP',style: TextStyle(
               color: Colors.white
             ),)),
             TextButton(onPressed: (){}, child: Row(
               children: [
                 Text('NEXT',style: TextStyle(
                     color: Colors.white
                 ),),
                 Icon(Icons.arrow_forward_rounded,color: AppColor.white,size: 20.sp,)
               ],
             )),
           ],
         )
          ],

        ),
      ),
    );
  }
}
