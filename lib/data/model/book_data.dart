class BookData {
  late int id;
  late int scroll;
  late String data;

  BookData({required this.id, required this.scroll, required this.data});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "scroll": scroll,
        "data": data,
      };

  // 2. Map -> Dart(response)
  BookData.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        scroll = json["scroll"],
        data = json["data"];
}
