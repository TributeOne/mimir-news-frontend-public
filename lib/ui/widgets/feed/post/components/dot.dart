import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff999da3), width: 2.5),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Container(
          //margin: const EdgeInsets.only(left: 3, top: 3, bottom: 3, right: 3),
          //padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff999da3), width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
