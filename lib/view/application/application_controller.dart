import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/view/application/state.dart';

class ApplicationController extends GetxController{
  final applicationState = ApplicationState();
  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged(int index){
    applicationState.page = index;
  }

  @override
  void onInit(){
    super.onInit();
    tabTitles = ['Chat','Contact','Profile'];
    bottomTabs = <BottomNavigationBarItem>[
       const BottomNavigationBarItem(
         label: 'Chat',
           icon: Icon(Icons.message),
         backgroundColor: AppColor.greyColor
       ),
      const BottomNavigationBarItem(
        label: 'Contact',
          icon: Icon(Icons.contact_page),
          backgroundColor: AppColor.greyColor
      ),
      const BottomNavigationBarItem(
        label: 'Profile',
          icon: Icon(Icons.person),
          backgroundColor: AppColor.greyColor
      ),
    ];
    pageController = PageController(
      initialPage: applicationState.page,
    );
  }

  void handleBottomTabs(int index){
    pageController.jumpToPage(index);
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

}