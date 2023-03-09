import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../functions/routes/route.dart';
import '../widgets/login/big_button_widget.dart';
import '../widgets/login/big_textbox_head_widget.dart';
import '../widgets/login/big_textbox_widget.dart';
import '../widgets/login/login_logo_widget.dart';
import '../widgets/login/big_textbutton_right_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import '../../functions/controller/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key? key}) : super(key: key);


  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          alignment: FractionalOffset.bottomCenter,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      BigTextboxHeadWidget(
                          bigButtonTextHead: 'First Name'),
                      BigTextBoxWidget(
                        hintText: 'First Name',
                        prefixIconData: Icons.person_outline,
                        suffixIconData: Icons.close,
                        autocorrect: false,
                        passwordField: false,
                        emailField: false,
                        controller: controller.firstNameRegisterController,
                      ),
                      BigTextboxHeadWidget(
                          bigButtonTextHead: 'Last Name'),
                      BigTextBoxWidget(
                        hintText: 'Last Name',
                        prefixIconData: Icons.person_outline,
                        suffixIconData: Icons.close,
                        autocorrect: false,
                        passwordField: false,
                        emailField: false,
                        controller: controller.lastNameRegisterController,
                      ),
                      BigTextboxHeadWidget(
                          bigButtonTextHead: 'Your E-Mail address'),
                      BigTextBoxWidget(
                        hintText: 'example@mail.com',
                        prefixIconData: Icons.mail_outline,
                        suffixIconData: Icons.close,
                        autocorrect: false,
                        passwordField: false,
                        emailField: true,
                        controller: controller.emailRegisterController,
                      ),
                      BigTextboxHeadWidget(
                          bigButtonTextHead: 'Choose password'),
                      BigTextBoxWidget(
                        hintText: 'Password',
                        prefixIconData: Icons.lock_outline,
                        suffixIconData: Icons.close,
                        autocorrect: false,
                        passwordField: true,
                        emailField: false,
                        controller: controller.passwordRegisterController,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
                        child: Text(
                          'By tapping "Register", you agree to our Terms of Use. Our Data Policy explains how we collect, use, and share your data. Our Cookie Policy explains how we use cookies and similar technologies. Mímir may send you notifications via SMS, which you can unsubscribe from at any time.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff4e5155),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      BigTextbuttonRightWidget(
                        title: 'Read Terms of Use?',
                        onTap: () => {
                          _launchURL('https://mimirnews.com/')
                          },
                      ),
                      BigButtonWidget(
                        title: 'Register',
                        hasBorder: true,
                        //toRoute: Routes.ROUTE_REGISTER,
                        onTap: () => {
                          print(controller.firstNameRegisterController),
                          print(controller.lastNameRegisterController),
                          print(controller.emailRegisterController),
                          print(controller.passwordRegisterController),
                          GetUtils.isEmail(controller.emailRegisterController.text) && GetUtils.isLengthGreaterOrEqual(controller.passwordRegisterController.text, 3)
                              ? {
                            print('Email and Password is Valid'),
                            controller.register(controller.firstNameRegisterController.text, controller.lastNameRegisterController.text, controller.emailRegisterController.text, controller.passwordRegisterController.text),
                            Get.snackbar('Register', 'Register successfully, Now just Login'),
                            Get.toNamed(Routes.ROUTE_LOGIN),
                          }
                              : {
                            print('Email or Password is invalid'),
                            Get.snackbar('Login', 'Invalid email or password')
                          },
                        },
                      ),
                      BigButtonWidget(
                        title: 'Go back to Login',
                        hasBorder: false,
                        onTap: () => print('Go back to Login'),
                        toRoute: Routes.ROUTE_POP,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (!await launch(url, forceWebView: true)) throw 'Could not launch $url';
  }
}
