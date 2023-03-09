import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

import '../provider/register_provider.dart';

class RegisterController extends GetxController {
  final registerProvider = RegisterProvider();
  final firstNameRegisterController = TextEditingController();
  final lastNameRegisterController = TextEditingController();
  final emailRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();



  register(String firstName, String lastName, String email, String password) async {
    var response = await registerProvider.register(firstName, lastName, email, password, );
    print(response.body.toString());
  }
}
