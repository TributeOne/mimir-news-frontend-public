import 'package:flutter/material.dart';

class PublicationsWidget extends StatefulWidget {
  const PublicationsWidget({
    required this.postPublicationsData,
  });

  final String postPublicationsData;

  @override
  State<PublicationsWidget> createState() => _PublicationsWidgetState();
}

class _PublicationsWidgetState extends State<PublicationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          padding:
              const EdgeInsets.only(left: 4.5, top: 3, bottom: 3, right: 3.5),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff999da3), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 3),
                child: Icon(
                  Icons.public,
                  color: Color(0xff999da3),
                  size: 10,
                ),
              ),
              Text(
                widget.postPublicationsData,
                style: const TextStyle(
                    fontSize: 9,
                    color: Color(0xff999da3),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Publications',
                  style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff999da3),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ))),
      ],
    );
  }
}
