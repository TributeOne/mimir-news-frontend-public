import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:decorated_icon/decorated_icon.dart';

import 'settings_dropdown_widget.dart';
import 'dart:ui';

class NavbarTopWidget extends StatelessWidget {
  const NavbarTopWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(

          bottom: 40,

        ),
      child: Container(
      child: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        //height: height!,
        //width: width!,
        padding: EdgeInsets.only(
          top: 40,
          left: 25,
          right: 25,
        ),
        //color: Color(0xffffff).withOpacity(0.5),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                DropShadowImage(
                 image: Image.asset(
                    'assets/mimir_logo_round.png',
                    scale: 25,
                  ),
                 //color: Color(0x33000000),
                 offset: Offset(0, 3),
                 blurRadius: 6,
               ),

            Image.asset(
              'assets/mimir_text_grey.png',
              scale: 4.5,
            ),
            SettingsDropdownWidget(),
          ],
        ),
      ),


      ),
    )
      ),
    );

  }
}
