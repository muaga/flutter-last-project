class BookMonthReqDTO {
  final int bookCategoryId;
  final String alignment;

  BookMonthReqDTO({required this.bookCategoryId, required this.alignment});

  Map<String, dynamic> toJson() => {
        "bookCategoryId": bookCategoryId,
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

class BookSearchReqDTO {
  final String keyword;

  BookSearchReqDTO({required this.keyword});

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
      };
}
