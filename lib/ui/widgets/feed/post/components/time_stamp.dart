import 'package:flutter/material.dart';
import 'dot.dart';
import 'line.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeStamp extends StatelessWidget {
  final bool? first;
  final bool? backGroundText;
  final DateTime? timeStempData;

  TimeStamp({
    this.first,
    this.backGroundText,
    this.timeStempData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Column(
              children: [
                if (first == null || first == false)
                  Line(
                    height: 10,
                  )
                else
                  Container(
                    height: 10,
                  ),
                Dot(),
                Line(
                  height: 10,
                ),
              ],
            ),
              Offstage(
                offstage: timeStempData == null ? true : false,
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    timeago.format(timeStempData != null ? timeStempData! : DateTime.now(), locale: 'en_long'),
                    style: backGroundText != null ?
                    TextStyle(
                        fontSize: 18,
                        color: Color(0xff4e5155),
                        fontFamily: 'Lora',
                        fontWeight: FontWeight.w700) :
                    TextStyle(
                        fontSize: 13,
                        color: Color(0xff999da3),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              )
          ],
    );
  }
}
