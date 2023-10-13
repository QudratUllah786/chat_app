import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'index.dart';
class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          ()=> SizedBox(
          width: 360.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                controller: PageController(
                  initialPage: 0,
                  keepPage: false,
                  viewportFraction: 1,
                ),
                pageSnapping: true,
                reverse: false,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (i){
                  controller.increment(i);
                },
                children: [
                  const FirstPage(),
                  const SecondPage(),
                  ThirdPage(
                    onPressed: (){
                      controller.handleSignIn();
                    },
                  ),
                ],
              ),
              Positioned(
                bottom: 240,
                  child: DotsIndicator(
                    decorator: DotsDecorator(
                      activeSize: const Size(28.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      activeColors: [
                        AppColor.onboardingFirstColor,
                        AppColor.onboardingSecondColor,
                        AppColor.onboardingThirdColor,
                      ]

                    ),
                    position: controller.welcomeState.index.value,
                      dotsCount: 3,
                    reversed: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
            ],
          ),
      ),
        ),
    );
  }
}
