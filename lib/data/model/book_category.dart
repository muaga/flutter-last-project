class BookCategory {
  late int id;
  late String categoryName;

  BookCategory({required this.id, required this.categoryName});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
      };

  // 2. Map -> Dart(response)
  BookCategory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryName = json["categoryName"];
}

/// mock 데이터
List<BookCategory> bookCategorys = [
  BookCategory(id: 1, categoryName: "트랜드"),
  BookCategory(id: 2, categoryName: "라이프"),
  BookCategory(id: 3, categoryName: "힐링"),
  BookCategory(id: 4, categoryName: "지적교양"),
  BookCategory(id: 5, categoryName: "소설"),
];
