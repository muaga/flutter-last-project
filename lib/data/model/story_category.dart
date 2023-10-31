class StoryCategory {
  late int id;
  late String storyCategoryName;

  StoryCategory({required this.id, required this.storyCategoryName});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "storyCategoryName": storyCategoryName,
      };

  // 2. Map -> Dart(response)
  StoryCategory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        storyCategoryName = json["storyCategoryName"];
}

/// mock 데이터
List<StoryCategory> storyCategorys = [
  StoryCategory(id: 1, storyCategoryName: "로맨스/BL"),
  StoryCategory(id: 2, storyCategoryName: "판타지/무협"),
  StoryCategory(id: 3, storyCategoryName: "일반소설"),
];
