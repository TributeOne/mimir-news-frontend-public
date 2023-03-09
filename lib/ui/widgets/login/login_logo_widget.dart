import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                         Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          DropShadowImage(
            image: Image.asset(
              'assets/mimir_logo.png',
            ),
            //color: Color(0x33000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
          Image.asset(
            'assets/mimir_text_grey.png',
            scale: 4,
          ),
        ],
      ),
    );
  }
}
