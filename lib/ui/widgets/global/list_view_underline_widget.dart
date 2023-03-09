import 'package:flutter/material.dart';

class ListViewUnderlineWidget extends StatelessWidget {
  const ListViewUnderlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                             Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 0.9,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffc6c6c8),
        ),
      ),
    );
  }
}
