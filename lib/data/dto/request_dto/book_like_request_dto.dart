class BookLikeReqDTO {
  final int userId;
  final int bookId;

  BookLikeReqDTO({required this.userId, required this.bookId});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "bookId": bookId,
      };
}
