import 'package:flutter/material.dart';

class PoppinsTextWidget extends StatelessWidget {
  final String text;

  const PoppinsTextWidget({
    required this.text,

});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(
      text,
      style: const TextStyle(
          fontSize: 14,
          //color: Color(0xffcbd0d8),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500),
      textAlign: TextAlign.left,
    ));
  }
}
