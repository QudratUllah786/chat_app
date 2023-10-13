import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/view/application/index.dart';

import '../../resources/color/color.dart';
import '../contact/contact.dart';
class Application extends GetView<ApplicationController> {
  final state = ApplicationState();
   Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildPageView(){
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged:controller.handlePageChanged,
        children: [
          Center(
            child: Text('Text',style: TextStyle(
              color: Colors.blue
            ),),
          ),
         ContactPage(),
          Center(
            child: Text('Profile'),
          ),
        ],
      );
    }

    Widget _bottomNavigationBar(){
      return Obx(
        ()=> BottomNavigationBar(
          backgroundColor:AppColor.white,
            items: controller.bottomTabs,
          currentIndex: controller.applicationState.page,
          type: BottomNavigationBarType.fixed,
          onTap:controller.handleBottomTabs,
          selectedItemColor: AppColor.onboardingThirdColor,
          unselectedItemColor: AppColor.greyColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,

        ),
      );
    }



    return Scaffold(
      backgroundColor: AppColor.white,
      body: _buildPageView(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}
