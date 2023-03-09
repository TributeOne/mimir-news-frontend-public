import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../functions/routes/route.dart';

class BigButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final String? toRoute; // TODO: Rename to something like "toRoute" or whatever
  final Function? onTap;

  BigButtonWidget({
    required this.title,
    required this.hasBorder,
    this.toRoute,
    this.onTap
  });

  // void login_button_pressed() {
  //   print('Login Clicked');
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        child: Material(
          child: Ink(
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              //borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [Color(0xff944cde), Color(0xff584cde)],
                stops: [0.0, 1.0],
              ),

              color: !hasBorder ? Color(0xffffff) : Color(0xff584cde),
              border: !hasBorder
                  ? Border.all(
                      color: Color(0xff584cde),
                      width: 1.0,
                    )
                  : Border.fromBorderSide(BorderSide.none),
            ),
            child: InkWell(
                borderRadius: BorderRadius.circular(5.0),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: hasBorder ? Color(0xffffffff) : Color(0xff584cde),
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: (){
                  if (onTap != null) {
                    onTap!();
                  }

                  if (toRoute != null) {
                    if (toRoute == Routes.ROUTE_POP){
                      Get.back();
                    } else {
                      Get.toNamed(toRoute!);
                    }
                  }

                  // TODO: Throw error: no onTap & no toRoute
                }
            ),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        decoration: const BoxDecoration(
          boxShadow: [
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
