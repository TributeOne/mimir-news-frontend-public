import 'package:get/get.dart';

class RegisterProvider extends GetConnect {

  @override
  void onInit() {
    super.onInit();
  }

  // Post request
  Future<Response> register(String firstName, String lastName, String email, String password) => post('http://192.168.1.75:3000/user',
      {'firstName': firstName, 'lastName': lastName , 'email': email, 'password': password});
}
