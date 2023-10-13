import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:whatsappofficialclone/model/login_model/user_data_model.dart';
import 'package:whatsappofficialclone/resources/color/color.dart';
import 'package:whatsappofficialclone/resources/localization/language.dart';
import 'package:whatsappofficialclone/resources/services/storage_service.dart';
import 'package:whatsappofficialclone/resources/store/config_store.dart';
import 'package:whatsappofficialclone/resources/store/user_store.dart';
import 'package:whatsappofficialclone/utils/routes/name_routes.dart';
import 'package:whatsappofficialclone/utils/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() =>StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());
  Get.put<UserDataModel>(UserDataModel());
  // Get.put<ConfigStore>(ConfigStore());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.initialRoute,
          getPages: AppRoutes.appRoutes(),
           translations: Languages(),
           locale: const Locale('en','US'),
          fallbackLocale: const Locale('ur','PK'),
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData.dark().copyWith(
            primaryColor: AppColor.white,
            scaffoldBackgroundColor:AppColor.blackColor,
            primaryIconTheme: IconThemeData(
              color: AppColor.white,
            )
          )
        );
      },
    );
  }
}