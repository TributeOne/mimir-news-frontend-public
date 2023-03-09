import 'package:flutter/material.dart';
import '../../pages/page_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsProviderSlider extends StatefulWidget {
  const NewsProviderSlider({Key? key}) : super(key: key);

  @override
  State<NewsProviderSlider> createState() => _NewsProviderSlider();
}

class _NewsProviderSlider extends State<NewsProviderSlider> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: new List.generate(90, (int index) {
              return Column(
                children: [
                  new Card(
                    color: Colors.blue[index * 100],
                    child: SizedBox(
                      child: new Container(
                        width: 50.0,
                        height: 50.0,
                        child: new Text("$index"),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
