class BookMarkReqDTO {
  final int userId;
  final int bookId;
  final int scroll;

  BookMarkReqDTO(
      {required this.userId, required this.bookId, required this.scroll});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "bookId": bookId,
        "scroll": scroll,
      };
}
