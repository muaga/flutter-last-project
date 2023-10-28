// TODO : bookLike가 생기면 나오게 하기
class BookLike {
  late int id;
  late int userId;
  late int bookId;
  final String? createdAt;

  BookLike(
      {required this.id,
      required this.userId,
      required this.bookId,
      this.createdAt});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "bookId": bookId,
      };

  // 2. Map -> Dart(response)
  BookLike.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        bookId = json["bookId"],
        createdAt = json["createdAt"];
}

// 북 좋아요 유무 -> 1번 있음 2번 없음

// mock 데이터
List<BookLike> bookLikes = [
  BookLike(id: 1, userId: 1, bookId: 1),
];
