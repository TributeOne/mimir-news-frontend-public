import 'package:get/get.dart';
import 'package:mimir_news_frontend/ui/views/login_page.dart';
import 'package:mimir_news_frontend/ui/views/profile_page.dart';
import '';
import '../../ui/views/dev_page.dart';
import '../../ui/views/feed_page.dart';
import '../../ui/views/forget_password_page.dart';
import '../../ui/views/register_page.dart';

class Routes {

  static const ROUTE_FEED = '/feedPage';
  static const ROUTE_LOGIN = '/loginPage';
  static const ROUTE_REGISTER = '/registerPage';
  static const ROUTE_FORGETPASSWORD = '/forgetPasswordPage';
  static const ROUTE_PROFILE = '/profilePage';
  static const ROUTE_POP = '/popPage';
  static const ROUTE_DEV = '/devPage';
  static const ROUTE_TEST = '/test';


  static final routes = [
    GetPage(
      name: '/feedPage',
      page: () => FeedPage(),
      //binding: Feed(),
    ),
    GetPage(
      name: '/loginPage',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/registerPage',
      page: () => RegisterPage(),
    ),
    GetPage(
      name: '/forgetPasswordPage',
      page: () => ForgetPasswordPage(),
    ),
    GetPage(
      name: '/profilePage',
      page: () => ProfilePage(),
    ),
    GetPage(
      name: '/devPage',
      page: () => DevPage(),
    ),
    GetPage(
      name: '/popPage',
      page: () => ForgetPasswordPage(),
    ),

    // es gibt Get.back();
    // auch Get.toNamed('/Home);
  ];
}
