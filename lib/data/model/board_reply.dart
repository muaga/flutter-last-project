class BoardReply {
  late int id;
  late String content;
  final String? createdAt;
  late int userId;
  late int boardId;

  BoardReply(
      {required this.id,
      required this.content,
      this.createdAt,
      required this.userId,
      required this.boardId});

  // 1. Dart -> Map(request)
  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "userId": userId,
        "boardId": boardId,
      };

  // 2. Map -> Dart(response) * createdAt 추가
  BoardReply.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        userId = json["userId"],
        boardId = json["boardId"],
        createdAt = json["createdAt"];
}

List<BoardReply> boardReplys = [
  BoardReply(
      id: 1,
      content: "좋은 책 추천 해주셔서 감사합니다",
      createdAt: "2023-10-10",
      userId: 1,
      boardId: 1)
];
