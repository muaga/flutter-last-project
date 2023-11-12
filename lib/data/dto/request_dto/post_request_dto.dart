class PostSaveReqDTO {
  final String boardTitle;
  final String content;
  final int? bookId;
  final int userId;
  PostSaveReqDTO(
      {required this.boardTitle,
      required this.content,
      this.bookId,
      required this.userId});

  Map<String, dynamic> toJson() => {
        "boardTitle": boardTitle,
        "content": content,
        "bookId": bookId,
        "userId": userId,
      };
}

class PostUpdateReqDTO {
  final String boardTitle;
  final String content;
  final int? bookId;
  final int userId;
  PostUpdateReqDTO(
      {required this.boardTitle,
      required this.content,
      this.bookId,
      required this.userId});

  Map<String, dynamic> toJson() => {
        "boardTitle": boardTitle,
        "content": content,
        "bookId": bookId,
        "userId": userId,
      };
}

class PostDeleteReqDTO {
  final int boardId;
  PostDeleteReqDTO(
      {required this.boardId});

  Map<String, dynamic> toJson() => {
    "bookId": boardId,
  };
}