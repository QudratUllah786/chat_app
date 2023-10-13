import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';

AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget> ?actions,
}){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 176, 106, 231),
          Color.fromARGB(255, 166, 112, 232),
          Color.fromARGB(255, 131, 123, 232),
          Color.fromARGB(255, 104, 132, 231),
        ],transform: GradientRotation(90),

        )
      ),
    ),
    leading: leading,
    title: title != null? Center(
      child: title,
    ):null,
    actions: actions,
  );
}


Widget divider10Px(){
  return Container(
    height: 10.w,
    decoration: const BoxDecoration(
      color: AppColor.primaryBackground
    ),
  );
}