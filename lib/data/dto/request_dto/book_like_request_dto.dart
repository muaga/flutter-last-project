class BookLikeRequestDTO {
  final int userId;
  final int bookId;

  BookLikeRequestDTO({required this.userId, required this.bookId});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "bookId": bookId,
      };
}
