import 'package:get/get.dart';
import 'package:whatsappofficialclone/view/auth-screen/login_screen.dart';
import 'package:whatsappofficialclone/view/contact/contact_binding.dart';
import 'package:whatsappofficialclone/view/sign-in/sign_in.dart';

import '../../resources/middleware/router_welcome.dart';
import '../../view/application/application.dart';
import '../../view/application/application_binding.dart';
import '../../view/auth-screen/otp_screen.dart';
import '../../view/contact/contact.dart';
import '../../view/message/chat/chat_binding.dart';
import '../../view/message/chat/chat_screen.dart';
import '../../view/sign-in/sign_in_binding.dart';
import '../../view/welcome/welcome.dart';
import '../../view/welcome/welcome_binding.dart';
import 'name_routes.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.initialRoute,
          page: () =>  const WelcomeScreen(),
          transition: Transition.leftToRight,
          binding: WelcomeBinding(),
            middlewares: [
              RouteWelcomeMiddleware(
                  priority: 1
              ),
            ]
        ),
    GetPage(
        name: RouteName.signInRoute,
        page:()=> const SignInScreen(),
      transition: Transition.leftToRight,
      binding: SignInBinding(),
    ),
    GetPage(
        name: RouteName.loginRoute,
        page: ()=>  LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: RouteName.otpRoute,
        page: ()=>  OtpScreen(
      verificationID: Get.arguments as String,
    )),
    GetPage(
      name: RouteName.applicationRoute,
        page: ()=>   Application(),
      binding: ApplicationBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(name: RouteName.contactRoute,
        page:()=> const ContactPage(),
    binding: ContactBinding(),
    ),
    GetPage(
            name: RouteName.chatRoute,
            page: () => const ChatScreen(),
            binding: ChatBinding(),
    ),
      ];
}
