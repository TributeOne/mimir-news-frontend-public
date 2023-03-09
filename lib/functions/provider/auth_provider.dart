import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends GetConnect {
  final storage = GetStorage();

  @override
  void onInit() {
    final token = storage.read('token');
    if (token != null) addTokenToRequest(storage.read('token'));

    super.onInit();
  }

  void addTokenToRequest(String token) {
    httpClient.addRequestModifier<dynamic>((request) {
      //String token = storage.read('token');
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  Future<Response> getAuth() => get('http://192.168.1.75:3000/auth');

  Future<Response> login(String email, String password) => post(
      'http://192.168.1.75:3000/auth/login',
      {'email': email, 'password': password});
}
