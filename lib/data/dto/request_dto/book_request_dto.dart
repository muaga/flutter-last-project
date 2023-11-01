class BookRequestDTO {
  final int bookCategowryId;
  final String alignment;

  BookRequestDTO({required this.bookCategowryId, required this.alignment});

  Map<String, dynamic> toJson() => {
        "bookCategowryId": bookCategowryId,
        "alignment": alignment,
      };
}
