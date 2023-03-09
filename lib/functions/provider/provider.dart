import 'package:get/get.dart';

class Provider extends GetConnect{

  Future<dynamic> getUser() async{
    //final response = await get('http://192.168.1.20:3000/auth');
    final response = await get('http://192.168.1.75:3000/app/health');
    //final response = await get('https://reqres.in/api/users?page=2');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}