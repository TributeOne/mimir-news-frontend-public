import 'package:flutter/material.dart';
import '../../pages/page_1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    required this.postImageArrayData,
  });

  final List<String> postImageArrayData;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190,
          width: MediaQuery.of(context).size.width,
          child: PageView(
              controller: _controller,
              children: widget.postImageArrayData.map((item) {
                return Page1(postImageData: item);
              }).toList()),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: SmoothPageIndicator(
              controller: _controller,
              count: widget.postImageArrayData.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xff944cde),
                dotColor: Color(0xffc8d0d8),
                dotHeight: 7,
                dotWidth: 7,
                spacing: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
