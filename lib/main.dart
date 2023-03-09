import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mimir_news_frontend/functions/controller/login_controller.dart';
import 'package:mimir_news_frontend/functions/routes/route.dart';
import './functions/utils/globals.dart' as globals;

var bootpage;

Future<void> main() async {
  await initServices();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

Future<void> initServices() async {
  print('Initializing services');
  await GetStorage.init();
  final box = GetStorage();
  print(box.read('token'));
  if (box.read('token') != null) {
    bootpage = Routes.ROUTE_FEED;
    final loginController = Get.put(LoginController());
    await loginController.getAuthInfo();
    print('===========');
    print(loginController.authData().toString());
    globals.devtoolsEnabled = loginController.authData().roles!.contains('admin');

  }
  else {
    bootpage = Routes.ROUTE_LOGIN;

  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Mímir News',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        initialRoute: bootpage, getPages: Routes.routes
        //initialRoute: Routes.ROUTE_LOGIN, getPages: Routes.routes
    );
  }
}
