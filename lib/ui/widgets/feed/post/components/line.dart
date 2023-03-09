import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double height;
  final bool? invisable;
  final bool? fadeout;

  Line({
    required this.height,
    this.invisable,
    this.fadeout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 2.5,
      decoration: fadeout != null ? BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff999da3),
            Colors.white,
          ],
        ),
      ) : BoxDecoration(
        color: Color(0xff999da3),
      ),
    );
  }
}
