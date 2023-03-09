import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../functions/controller/login_controller.dart';
import '../../functions/routes/route.dart';
import '../widgets/login/big_button_widget.dart';
import '../widgets/login/big_textbox_head_widget.dart';
import '../widgets/login/big_textbox_widget.dart';
import '../widgets/login/login_logo_widget.dart';
import '../widgets/login/big_textbutton_right_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      if (!isKeyboard)
                        const Padding(
                          padding: EdgeInsets.only(
                              bottom: 100.0, left: 15, right: 15),
                          child: Text(
                            'Just enter the E-Mail address you registered with in the input field. We will send you a link to your E-Mail address to reset your password. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff4e5155),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      BigTextboxHeadWidget(
                          bigButtonTextHead: "Your registered E-Mail Address"),
                      BigTextBoxWidget(
                        hintText: 'example@mail.com',
                        prefixIconData: Icons.mail_outline,
                        suffixIconData: Icons.done,
                        autocorrect: false,
                        passwordField: false,
                        emailField: true,
                        controller: null,
                      ),
                      BigTextbuttonRightWidget(
                        title: 'Need Help? Send us a E-Mail.',
                        onTap: () => {
                          _launchURL('mailto:email@example.com')
                        },
                      ),
                      BigButtonWidget(
                        title: 'Send me a link to reset the password',
                        hasBorder: true,
                        toRoute: Routes.ROUTE_REGISTER,
                      ),
                      BigButtonWidget(
                        title: 'Go back',
                        hasBorder: false,
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
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
