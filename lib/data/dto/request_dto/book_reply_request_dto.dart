class BookReplyWriteReqDTO {
  final String bookId;
  final String content;

  BookReplyWriteReqDTO({required this.bookId, required this.content});

  Map<String, dynamic> toJson() => {"bookId": bookId, "content": content};
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
