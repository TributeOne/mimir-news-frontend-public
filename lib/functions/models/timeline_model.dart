class Timeline {
  late String id;
  late String title;
  late DateTime date;
  late List<String> images;
  late int publicationAmount;

  Timeline(
      {required this.id, required this.title, required this.date, required this.images, required this.publicationAmount});

  Timeline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = DateTime.parse(json['date']);
    images = json['images'].cast<String>();
    publicationAmount = json['publicationAmount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['images'] = images;
    data['publicationAmount'] = publicationAmount;
    return data;
  }
}
