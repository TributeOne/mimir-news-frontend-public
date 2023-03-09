import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class Page1 extends StatelessWidget {
  const Page1({
    required this.postImageData,
  });

  final String postImageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        decoration: new BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(7.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.memory(
            base64Decode(base64.normalize(postImageData)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
