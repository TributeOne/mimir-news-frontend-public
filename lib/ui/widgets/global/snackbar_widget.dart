import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepPurple,

            //border: Border.all(color: Colors.green, width: 3),

            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              const Icon(Icons.favorite, color: Colors.green ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('Yay! A SnackBar!\nYou did great!', style: TextStyle(color: Colors.green)),
              ),
              const Spacer(),
              TextButton(onPressed: () => debugPrint("Undid"), child: Text("Undo"))
            ],
          )
      ),
    );
  }
}
