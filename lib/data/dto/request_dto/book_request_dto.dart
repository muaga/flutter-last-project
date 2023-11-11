class BookReqDTO {
  final int bookCategoryId;
  final String alignment;

  BookReqDTO({required this.bookCategoryId, required this.alignment});

  Map<String, dynamic> toJson() => {
        "bookCategowryId": bookCategoryId,
        "alignment": alignment,
      };
}

class BookCategoryReqDTO {
  final int bookCategoryId;
  final String alignment;
  final int minusMonths;

  BookCategoryReqDTO(
      {required this.bookCategoryId,
      required this.alignment,
      required this.minusMonths});

  Map<String, dynamic> toJson() => {
        "bookCategoryId": bookCategoryId,
        "alignment": alignment,
        "minusMonths": minusMonths,
      };
}
