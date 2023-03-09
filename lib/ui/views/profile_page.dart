import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../functions/controller/login_controller.dart';
import '../../functions/routes/route.dart';
import '../widgets/feed/post/components/devtools.dart';
import '../widgets/feed/post/components/generic_table.dart';
import '../widgets/login/big_button_widget.dart';

class ProfilePage extends GetView<LoginController> {
  ProfilePage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xfff2f1f6),
        body: Container(
          alignment: FractionalOffset.bottomCenter,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[

                      Devtools(
                        child: Obx(() => GenericTable(
                          title: 'Dev View Account Details',
                          tableItems: controller.authData().toJson().entries.map((e) => GenericTableItem(key: e.key, value: e.value)).toList(),
                          backgroundColor: 0xfffffffff,
                        )),
                      ),

                      Obx(() => GenericTable(
                        title: 'Account Details',
                        tableItems: [
                          GenericTableItem(key: 'Firstname: ', value: controller.authData().firstName.toString()),
                          GenericTableItem(key: 'Lastname: ', value: controller.authData().lastName.toString()),
                          GenericTableItem(key: 'Email: ', value: controller.authData().email.toString()),
                        ],
                        backgroundColor: 0xfffffffff,
                      )),

                      BigButtonWidget(
                        title: 'Go Back',
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
}
