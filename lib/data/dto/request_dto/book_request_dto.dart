class BookReqDTO {
  final int bookCategoryId;
  final String alignment;

  BookReqDTO({required this.bookCategoryId, required this.alignment});

  Map<String, dynamic> toJson() => {
        "bookCategoryId": bookCategoryId,
        "alignment": alignment,
      };
}
