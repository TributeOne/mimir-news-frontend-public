import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PostTitleWidget extends StatefulWidget {
  const PostTitleWidget({
    required this.postHeadTitleData,
});

  final String postHeadTitleData;

  @override
  State<PostTitleWidget> createState() => _PostTitleWidgetState();
}

class _PostTitleWidgetState extends State<PostTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 18, top: 10, bottom: 0),

          child: AutoSizeText(
            widget.postHeadTitleData,
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff4e5155),
              fontFamily: 'Lora',
              fontWeight: FontWeight.w700
          ),
            minFontSize: 10,
            stepGranularity: 10,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
        )

        ));
  }
}
