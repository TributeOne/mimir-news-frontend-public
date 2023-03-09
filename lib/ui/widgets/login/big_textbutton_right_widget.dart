import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../functions/routes/route.dart';

class BigTextbuttonRightWidget extends StatelessWidget {
  final String title;
  final String? toRoute;
  final Function? onTap;

  BigTextbuttonRightWidget({required this.title, this.toRoute, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              child: Text(
                title,
                style: const TextStyle(
                    color: Color(0xff584cde),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
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
              },
              borderRadius: BorderRadius.circular(5.0),
            ),
          ],
        ),
      ),
    );
  }
}
