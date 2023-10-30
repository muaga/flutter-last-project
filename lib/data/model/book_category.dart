class BookCategory {
  late int id;
  late String categoryName;
  final String? categoryAbout;
  final String? categoryPicUrl;

  BookCategory(
      {required this.id,
      required this.categoryName,
      this.categoryAbout,
      this.categoryPicUrl});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
      };

  // 2. Map -> Dart(response)
  BookCategory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryName = json["categoryName"],
        categoryAbout = json["categoryAbout"],
        categoryPicUrl = json["categoryPicUrl"];
}

/// mock 데이터
List<BookCategory> bookCategorys = [
  BookCategory(
      id: 1,
      categoryName: "트렌드",
      categoryAbout: "사회적 트렌드, 기술 및 디지털 트렌드, 경제 밎 비즈니스 트렌드",
      categoryPicUrl: "book7.png"),
  BookCategory(
      id: 2,
      categoryName: "라이프",
      categoryAbout: "음식, 술·음료, 스포츠, 헬스·요가, 뷰티, 인테리어",
      categoryPicUrl: "book14.png"),
  BookCategory(
      id: 3,
      categoryName: "힐링",
      categoryAbout: "스트레스 관리, 명상, 요가, 자연 치유, 예술 치유",
      categoryPicUrl: "book24.png"),
  BookCategory(
      id: 4,
      categoryName: "지적교양",
      categoryAbout: "인문학, 과학, 역사, 문학, 미술, 철학",
      categoryPicUrl: "book28.png"),
  BookCategory(
      id: 5,
      categoryName: "소설",
      categoryAbout: "추리·스릴러, 킬러 스파이, 법의학 스릴러, SF",
      categoryPicUrl: "book31.png"),
];
