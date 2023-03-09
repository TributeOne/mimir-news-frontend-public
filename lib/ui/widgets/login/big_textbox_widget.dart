import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigTextBoxWidget extends StatefulWidget {
  const BigTextBoxWidget({
    required this.hintText,
    required this.prefixIconData,
    required this.suffixIconData,
    required this.autocorrect,
    required this.passwordField,
    required this.emailField,
    required this.controller,
  });

  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool autocorrect;
  final bool passwordField;
  final bool emailField;
  final controller;

  @override
  _BigTextBoxWidgetState createState() => _BigTextBoxWidgetState();
}

class _BigTextBoxWidgetState extends State<BigTextBoxWidget> {
  bool _obscureText = true;

  //final emailController = TextEditingController();
  //final passwordController = TextEditingController();
  //final normalTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        child: TextFormField(
          controller: widget.controller,
          //onChanged: onChanged,
          style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              color: Color(0xff4e5155),
              fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            labelText: widget.hintText,
            prefixIcon: Icon(
              widget.prefixIconData,
              size: 27,
              color: const Color(0xff584cde),
            ),
            filled: true,
            fillColor: const Color(0xffffffff),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            suffixIcon: widget.passwordField
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 18,
                      color: const Color(0xffcbd0d8),
                    ),
                  )
                //: widget.emailField
                //    ? Icon(
                //        (!GetUtils.isEmail(emailController.text))
                //            ? Icons.close
                //            : Icons.done,
                //        //Icons.done,
                //        size: 18,
                //        color: const Color(0xffcbd0d8),
                //      )
                : Icon(
                    Icons.done,
                    size: 18,
                    color: const Color(0xffcbd0d8),
                  ),
            labelStyle: const TextStyle(
              color: Color(0xff4e5155),
              //focusColor: color: Color(0xffcbd0d8),
            ),
          ),
          autocorrect: widget.autocorrect,
          obscureText: !widget.passwordField ? false : _obscureText,
          //obscureText: widget.obscureText,
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
      ),
    );
  }
}
