import 'package:flutter/material.dart';
import 'drag_handle_widget.dart';

class DragHandleWidget extends StatelessWidget {
  const DragHandleWidget({
    required this.panelController,
  });

  final panelController;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xff999da3),
              //border: Border.all(color: Color(0xff999da3), width: 10.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      ),
      onTap: togglePanel,
    );
  }
  void togglePanel() => panelController.isPanelOpen ? panelController.close() : panelController.open() ;
}
