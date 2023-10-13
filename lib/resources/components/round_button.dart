import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/utils/utils.dart';
class RoundButton extends StatelessWidget {
  RoundButton(
      {super.key,
    required this.width,
    required this.height,
    required this.txt,
    required this.onTap,
    required this.radius,
    required this.fontSize,
    required this.fontWeight,
        required this.color,
        required this.backGroundColor,
  });
   final double width;
   final double height;
   final String txt;
   final double radius;
   VoidCallback onTap;
   final double fontSize;
   final FontWeight fontWeight;
   Color color = AppColor.blackColor;
   Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: context.mediaWidth*width,
        height: context.mediaHeight*height,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          txt,
          style:  TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
