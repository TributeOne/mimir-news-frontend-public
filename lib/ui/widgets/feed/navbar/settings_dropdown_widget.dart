import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:get/get.dart';
import '../../../../functions/controller/login_controller.dart';
import '../../../../functions/routes/route.dart';
import 'package:get_storage/get_storage.dart';

import 'focused_menu/focused_menu_widget.dart';
import 'focused_menu/moduals.dart';


class SettingsDropdownWidget extends StatefulWidget {
  const SettingsDropdownWidget({Key? key}) : super(key: key);

  @override
  State<SettingsDropdownWidget> createState() => _SettingsDropdownWidget();
}

class _SettingsDropdownWidget extends State<SettingsDropdownWidget> {

  final storage = GetStorage();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
        return Container(
          child: FocusedMenuHolder(

            menuItems: [
              FocusedMenuItem(
                title: Text('Profile Details' , style: const TextStyle(
                    fontSize: 14,
                    //color: Color(0xffcbd0d8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),),
                trailingIcon: Icon(Icons.person_outline),
                onPressed: () => {print('Profile Deteils'), controller.getAuthInfo(), Get.toNamed(Routes.ROUTE_PROFILE), },
              ),
              FocusedMenuItem(
                title: Text('Dev Page', style: const TextStyle(
                    fontSize: 14,
                    //color: Color(0xffcbd0d8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),),
                trailingIcon: Icon(Icons.more_horiz),
                onPressed: () => {print('Dev Page'), controller.getAuthInfo(), Get.toNamed(Routes.ROUTE_DEV), },
              ),
              FocusedMenuItem(
                title: Text('More Soon', style: const TextStyle(
                    fontSize: 14,
                    //color: Color(0xffcbd0d8),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),),
                 trailingIcon: Icon(Icons.more_horiz),
                 onPressed: () => {print('test')},
              ),
              FocusedMenuItem(
                title: Text('Log Out', style: TextStyle(color: Color(0xffffffff), fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500)),
                trailingIcon: Icon(Icons.logout, color: Color(0xffffffff)),
                backgroundColor: Color(0xffff0000),
                onPressed: () => {print('Sign Out'), storage.remove('token'), Get.toNamed(Routes.ROUTE_LOGIN)},
              ),
            ],

            //blurBackgroundColor: Color(0xffffffff),
            blurSize: 1,
            //menuItemExtent: 20,
            //menuWidth: MediaQuery.of(context).size.width,
            menuWidth: 250,
            menuOffset: 15,
            openWithTap: true,
            duration: Duration(milliseconds: 100),
            animateMenuItems: false,
            onPressed: () {

            },
            child: DecoratedIcon(
              Icons.settings_outlined,
              size: 42,
              color: Color(0xff4E5155),
              shadows: [
                BoxShadow(
                  color: Color(0x33000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        );
  }
}
