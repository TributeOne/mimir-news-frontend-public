import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mimir_news_frontend/functions/models/timeline_model.dart';
import '../provider/timeline_provider.dart';


class TimelineController extends GetxController {
  final scrollController = ScrollController();
  final RxList<Timeline> timelineItems = List<Timeline>.empty().obs;
  final timelineProvider = Get.put(TimelineProvider());

  //TODO: Implement TimelineControllerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        fetch();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetch() async {
    final date = timelineItems.length > 0 ? timelineItems[timelineItems.length -1].date.toIso8601String() : null;
    final response = await timelineProvider.getTimeline(3, date);
    timelineItems.addAll(response);
    print(timelineItems);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
