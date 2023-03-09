import 'package:flutter/material.dart';

class BigTextboxHeadWidget extends StatelessWidget {
  final bigButtonTextHead;

  BigTextboxHeadWidget({required this.bigButtonTextHead});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 10,),
            child: Text(
              bigButtonTextHead,
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xffcbd0d8),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )
        )
    );
  }
}
