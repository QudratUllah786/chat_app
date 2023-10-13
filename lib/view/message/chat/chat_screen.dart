import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsappofficialclone/utils/utils.dart';
import '../../../resources/assets/asset_images.dart';
import 'chart_controller.dart';
class ChatScreen extends GetView<ChatController> {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar _appBarWidget(){
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231)
            ],
            transform: GradientRotation(90)
            
            ),

          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 0.w,bottom: 0.w,right: 0.w),
          child: Row(
            children: [
               InkWell(
                 onTap: (){},
                 child: SizedBox(
                   width: 44.w,
                   height: 44.w,
                   child: Container(
                     padding: EdgeInsets.only(top: 0.w,bottom: 0.w,right: 0.w),
                     child: CachedNetworkImage(
                       imageUrl: controller.chatState.to_avatar.value,
                       imageBuilder: (context,imageProvider)=>Container(
                         height: 44.w,
                         width: 44.w,
                         margin: null,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(44.w)),
                           image: DecorationImage(image: imageProvider)
                         ),
                       ),
                       errorWidget: (context,url,error)=>Image(image: AssetImage(AssetImages.avatarImage)),
                     ),
                   ),
                 ),
               ),
              15.w.pw,
              Container(
                width: 180.w,
                padding: EdgeInsets.only(top: 0.w,right: 0.w,bottom: 0.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 44.w,
                      child: GestureDetector(
                        onTap: (){},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.chatState.to_name.value,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                            ),
                            Text('unknown location',
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
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

    return Scaffold(
      backgroundColor: AppColor.white,
         appBar: _appBarWidget(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child:  Stack(
            children: [
              Positioned(
                bottom: 0.h,
                  height: 50.h,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  //  padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 210.w,
                    height: 50.h,
                    child: TextField(
                      style: TextStyle(
                        color: AppColor.greyColor
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      controller: controller.textController,
                      focusNode: controller.contentFocus,
                      autofocus: false,
                      decoration:   InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        contentPadding: EdgeInsets.all(10),
                        
                        hintText: 'Send Message...',
                        hintStyle: TextStyle(
                          color: Colors.grey
                        )
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 30.h,
                    margin: const EdgeInsets.only(left: 5),
                    child: GestureDetector(
                      onTap: (){},
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.photo,size: 40,),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  10.h.pw,
                  Container(
                    width:65.w,
                    height: 35.h,
                    child: ElevatedButton(onPressed: (){
                      controller.sendMessage();
                    }, child: Text('Send')),
                  )

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
