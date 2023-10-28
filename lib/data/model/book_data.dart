class BookData {
  late int id;
  late String data;

  BookData({required this.id, required this.data});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data,
      };

  // 2. Map -> Dart(response)
  BookData.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        data = json["data"];
}
