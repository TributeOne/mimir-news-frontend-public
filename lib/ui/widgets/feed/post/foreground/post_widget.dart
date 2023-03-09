import 'package:flutter/material.dart';
import 'package:mimir_news_frontend/ui/widgets/feed/post/foreground/post_title_widget.dart';
import 'package:mimir_news_frontend/ui/widgets/feed/post/foreground/publications_widget.dart';
import 'package:mimir_news_frontend/ui/widgets/feed/post/components/time_stamp.dart';

import '../components/image_slider.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    required this.postTimeData,
    required this.postHeadTitleData,
    required this.postPublicationsData,
    required this.postImageArrayData,
});

  final DateTime postTimeData;
  final String postHeadTitleData;
  final String postPublicationsData;
  final List<String> postImageArrayData;

  @override
  State<PostWidget> createState() => _PostWidget();
}

class _PostWidget extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
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
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: TimeStamp(
                  first: false,
                  timeStempData: widget.postTimeData,
                ),
              ),

              ImageSlider(postImageArrayData: widget.postImageArrayData,),


              PostTitleWidget(
                  postHeadTitleData: widget.postHeadTitleData,
              ),

              PublicationsWidget(
                  postPublicationsData: widget.postPublicationsData,
              ),
            ],
          ),
        ),



      ],


    );
  }
}