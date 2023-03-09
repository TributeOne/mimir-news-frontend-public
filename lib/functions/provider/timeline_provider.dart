import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/timeline_model.dart';

class TimelineProvider extends GetConnect {
  final storage = GetStorage();

  @override
  void onInit() {
    /*
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Timeline.fromJson(map);
      if (map is List)
        return map.map((item) => Timeline.fromJson(item)).toList();
    };
    */
    //httpClient.baseUrl = 'http://192.168.1.75:3000/articles/article-data/';

    final token = storage.read('token');
    if (token != null) {
      httpClient.addRequestModifier<dynamic>((request) {
        //String token = storage.read('token');
        request.headers['Authorization'] = 'Bearer $token';
        return request;
      });
    }
  }

  Future<List<Timeline>> getTimeline(int limit , [String? date]) async {
    var timelineEndpoint = 'http://192.168.1.75:3000/articles/article-data/timeline/?limit=$limit';
    if (date != null ) {
      timelineEndpoint = timelineEndpoint + '&date=$date';
    }

    final response = await get(timelineEndpoint);
    print('=====');
    print(response.body.toString());
    print('=====');
    final timelinePosts = List<Timeline>.from(response.body.map((item) => Timeline.fromJson(item)));
    print(timelinePosts);
    return timelinePosts;
  }

  Future<Response<Timeline>> postTimeline(Timeline timeline) async =>
      await post('timeline', timeline);
  Future<Response> deleteTimeline(int id) async => await delete('timeline/$id');
}
