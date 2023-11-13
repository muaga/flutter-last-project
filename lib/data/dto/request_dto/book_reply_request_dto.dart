class BookReplyWriteReqDTO {
  final int? userId;
  final int? bookId;
  final String content;

  BookReplyWriteReqDTO(
      {required this.userId, required this.bookId, required this.content});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "bookId": bookId, "content": content};
}

class BookReplyUpdateReqDTO {
  final String content;
  final int userId;
  final int bookId;

  BookReplyUpdateReqDTO(
      {required this.content, required this.userId, required this.bookId});

  Map<String, dynamic> toJson() =>
      {"content": content, "userId": userId, "bookId": bookId};
}
