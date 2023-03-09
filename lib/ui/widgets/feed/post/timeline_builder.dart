import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimir_news_frontend/ui/widgets/feed/post/components/time_stamp.dart';
import '../../../../functions/controller/timeline_controller.dart';
import 'foreground/post_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TimelineBuilder extends GetView<TimelineController> {
  final controller = Get.put(TimelineController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          SizedBox(
            height: 110,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.timelineItems.length,
                  itemBuilder: (context, index) {
                    var renderTimestamp = index == 0 ? true : false;
                    if(index != 0 && controller.timelineItems[index - 1].date.day < controller.timelineItems[index].date.day) {
                      renderTimestamp = true;
                    }

                    if (index < controller.timelineItems.length) {
                      final timelinePost = controller.timelineItems[index];
                      return Column(
                        children: [
                          renderTimestamp ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TimeStamp(
                              first: index == 0 ? true : false,
                              timeStempData:  controller.timelineItems[index].date,
                                backGroundText : true,
                            ),
                          ) : const Stroke(),
                          PostWidget(
                              postTimeData: timelinePost.date,
                              postHeadTitleData: timelinePost.title,
                              postPublicationsData: timelinePost.publicationAmount.toString(),
                              postImageArrayData: timelinePost.images,
                          ),
                        ],
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                )),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}

class Stroke extends StatelessWidget {
  const Stroke({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         // Strich unten
      Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 15,
            width: 2.5,
            //height: 356,
            //padding: const EdgeInsets.only(left: 21.2, top: 0, bottom: 0, right: 0),
            margin: EdgeInsets.only(left: 18.5, top: 0, bottom: 0, right: 0),
            //padding: const EdgeInsets.only(left: 4.5, top: 3, bottom: 0, right: 3.5),
            decoration: BoxDecoration(
              color: Color(0xff999da3),
              //border: Border.all(color: Color(0xff999da3), width: 10.0),
              //borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
        ),
      );
  }
}
