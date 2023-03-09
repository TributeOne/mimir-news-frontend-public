import 'package:mimir_news_frontend/functions/models/auth_data_model.dart';
import 'package:mimir_news_frontend/functions/provider/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class LoginController extends GetxController {
  final storage = GetStorage();
  final authProvider = Get.put(AuthProvider());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var profileData = ''.obs;
  final authData = AuthData().obs;


  login(String email, String password) async {
    var response = await authProvider.login(email, password);
    //print(response.body);
    if (!response.hasError && response.body != null) {
      final token = response.body['token'];
      storage.write('token', token);
      authProvider.addTokenToRequest(token);
    } else {
      print(response.hasError);
    }
  }

  getAuthInfo() async {
    var response = await authProvider.getAuth();
    print(response.body.toString());
    authData(AuthData.fromJson(response.body));
    //authData().toJson();
    profileData(response.body.toString());
    return AuthData.fromJson(response.body);
  }
}
