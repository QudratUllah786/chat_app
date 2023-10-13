import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/routes/name_routes.dart';
import '../store/config_store.dart';
import '../store/user_store.dart';

class RouteWelcomeMiddleware extends GetMiddleware{
  @override
  int? priority = 0;
  RouteWelcomeMiddleware({
    required this.priority,
});
  @override
  RouteSettings? redirect(String? route){
    print(ConfigStore.to.isFirstOpen);
    if(ConfigStore.to.isFirstOpen == false){
      return null;
    }
    else if(UserStore.to.isLogin == true){
      return RouteSettings(name:RouteName.applicationRoute);

    }
    else{
      return RouteSettings(name: RouteName.signInRoute);
    }
  }
}