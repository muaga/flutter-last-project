class Board {
  late int id;
  late String title;
  late String content;
  final String? picUrl;
  final String? createdAt;
  late int userId;
  late int bookId;

  Board(
      {required this.id,
      required this.title,
      required this.content,
      this.picUrl,
      required this.createdAt,
      required this.userId,
      required this.bookId});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "picUrl": picUrl,
        "userId": userId,
        "bookId": bookId,
      };

  // 2. Map -> Dart(response) * createdAt 추가
  Board.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        picUrl = json["picUrl"],
        userId = json["userId"],
        bookId = json["bookId"],
        createdAt = json["createdAt"];
}

List<Board> boards = [
  Board(
      id: 1,
      title: "벤자민 하디의 퓨처셀프",
      content:
          "그동안 주춤했던 뇌를 깨우고 싶거나, 나를 성장시키고 싶으신 분들, 또는 자기 계발의 실질적 행동 지침이 필요하신 분들!! 이 책을 추천드립니다",
      createdAt: "2023-10-10",
      picUrl: "book7.png",
      userId: 1,
      bookId: 2),
];
