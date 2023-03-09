import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../functions/controller/login_controller.dart';
import '../../functions/routes/route.dart';
import '../widgets/login/big_button_widget.dart';
import '../widgets/login/big_textbox_head_widget.dart';
import '../widgets/login/big_textbox_widget.dart';
import '../widgets/login/login_logo_widget.dart';
import '../widgets/login/big_textbutton_right_widget.dart';

import 'package:get_storage/get_storage.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    //final emailController = TextEditingController();
    //final passwordController = TextEditingController();

    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.logout),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,

                        //border: Border.all(color: Colors.green, width: 3),

                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.favorite, color: Colors.green),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Yay! A SnackBar!\nYou did great!',
                                style: TextStyle(color: Colors.green)),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () => debugPrint("Undid"),
                              child: Text("Undo"))
                        ],
                      )),
                ),
              );
            },
          ),
          body: Container(
            alignment: FractionalOffset.bottomCenter,
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        if (!isKeyboard) const LoginLogo(),
                        BigTextboxHeadWidget(bigButtonTextHead: 'E-Mail'),
                        BigTextBoxWidget(
                          hintText: 'E-Mail',
                          prefixIconData: Icons.person_outline,
                          suffixIconData: Icons.done,
                          autocorrect: false,
                          passwordField: false,
                          emailField: true,
                          controller: controller.emailController,
                        ),
                        //PasswordField(),
                        BigTextboxHeadWidget(bigButtonTextHead: 'Password'),
                        BigTextBoxWidget(
                          hintText: 'Password',
                          prefixIconData: Icons.lock_outline,
                          suffixIconData: Icons.visibility,
                          autocorrect: false,
                          passwordField: true,
                          emailField: false,
                          controller: controller.passwordController,
                        ),
                        BigTextbuttonRightWidget(
                          title: 'Forget Password',
                          toRoute: Routes.ROUTE_FORGETPASSWORD,
                          onTap: () => {print('Register Now clicked')},
                        ),
                        BigButtonWidget(
                          title: 'Login',
                          hasBorder: true,
                          onTap: () async {
                            print(controller.emailController);
                            print(controller.passwordController);
                            GetUtils.isEmail(controller.emailController.text) && GetUtils.isLengthGreaterOrEqual(controller.passwordController.text, 3)
                                ? {await controller.login(controller.emailController.text, controller.passwordController.text),
                                    (box.read('token') != null) ? {
                                            print('Email and Password is Valid'),
                                            Get.snackbar('Login', 'Login successfully'),
                                            Get.toNamed(Routes.ROUTE_FEED),
                                          }
                                        : {
                                            print('Email or Password is invalid'),
                                            Get.snackbar('Login', 'Invalid email or password')
                                          },
                                  }
                                : {
                                    print('Email or Password is invalid'),
                                    Get.snackbar('Login', 'Invalid email or password')
                                  };
                          },
                        ),
                        BigButtonWidget(
                          title: 'Register Now',
                          hasBorder: false,
                          toRoute: Routes.ROUTE_REGISTER,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
