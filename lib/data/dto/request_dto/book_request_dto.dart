class BookReqDTO {
  final int bookCategowryId;
  final String alignment;

  BookReqDTO({required this.bookCategowryId, required this.alignment});

  Map<String, dynamic> toJson() => {
        "bookCategowryId": bookCategowryId,
        "alignment": alignment,
      };
}
