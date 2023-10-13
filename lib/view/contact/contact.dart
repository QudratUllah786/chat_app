import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/view/contact/widgets/contact_list.dart';

import '../../widgets/app_bar.dart';
import 'contact_controller.dart';
class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(controller.contactState.contactList.length.toString());
    AppBar _buildAppBar(){
      return transparentAppBar(
        title: Text("Contact",style: TextStyle(
          color: AppColor.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),)
      );
    }
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: _buildAppBar(),
      body: const ContactList(),
    );
  }
}
