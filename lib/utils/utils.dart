import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../resources/color/color.dart';

class Utils{
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColor.primaryBackground,
      textColor: AppColor.white,
      toastLength:Toast.LENGTH_LONG,
    gravity:ToastGravity.TOP,
    );
  }

  static snackBar(String s, 
      {String ?title,
        String ?message,
        SnackPosition ?position,
        Color ?color,
        Color ?txtColor}){
    Get.snackbar(
      padding: EdgeInsets.all(10.sp),
      margin:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      title!,
      message!,
      snackPosition: position,
      backgroundColor: color,
      colorText: txtColor,
      backgroundGradient: LinearGradient(colors: [
        Color.fromARGB(255, 176, 106, 231),
        Color.fromARGB(255, 166, 112, 231),
        Color.fromARGB(255, 131, 123, 231),
        Color.fromARGB(255, 104, 132, 231)
      ],
          transform: GradientRotation(90)

      ),
    );
  }

}

extension Padding on num{
  SizedBox get ph => SizedBox(height:toDouble());
  SizedBox get pw => SizedBox(width:toDouble());
}
extension MediaQueryValues on BuildContext{
 double get mediaHeight => MediaQuery.of(this).size.height;
 double get mediaWidth => MediaQuery.of(this).size.width;
}