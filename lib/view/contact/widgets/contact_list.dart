import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/model/login_model/user_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';

import '../contact_controller.dart';
class ContactList extends GetView<ContactController> {

  Widget listItem( UserDataModel item){
    return Container(
      child: InkWell(
        onTap: (){
       if(item.id != null){
         controller.goChat(item);
       }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 15.w,left: 15.w,right: 15.w),
              child: SizedBox(
                width: 54.w,
                height: 54.w,
                //  child: Image(image: NetworkImage(item.photoUrl.toString())),
                child: item.photoUrl == ""
                    ? const Image(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&usqp=CAU'))
                    : CachedNetworkImage(imageUrl: item.photoUrl.toString()),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.w),
              width: 250.w,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffe5efe5),
                      )
                  )
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 42.w,
                    child: Text(
                      item.name ??"",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppColor.blackColor
                      ),
                    ),
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() => CustomScrollView(
      slivers: [
        SliverPadding(padding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 0.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                var item = controller.contactState.contactList[index];
                return listItem(item);
              },
              childCount: controller.contactState.contactList.length,
            ),
          ),
        ),
      ],
    ));
  }
}
