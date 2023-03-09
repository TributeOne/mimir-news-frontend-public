import 'package:flutter/material.dart';
import '../../../../../functions/utils/globals.dart' as globals;

class Devtools extends StatelessWidget {
  final Widget child;
  const Devtools({
    required this.child
});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !globals.devtoolsEnabled,
      child: child,
    );
  }
}
