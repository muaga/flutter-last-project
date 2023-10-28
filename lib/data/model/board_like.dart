class BoardLike {
  late int id;
  final String? createdAt;
  late int userId;
  late int boardId;

  BoardLike(
      {required this.id,
      this.createdAt,
      required this.userId,
      required this.boardId});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "boardId": boardId,
      };

  // 2. Map -> Dart(response) * createdAt 추가
  BoardLike.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        userId = json["userId"],
        boardId = json["boardId"],
        createdAt = json["createdAt"];
}

List<BoardLike> boardLikes = [
  BoardLike(id: 1, userId: 1, boardId: 1),
];
