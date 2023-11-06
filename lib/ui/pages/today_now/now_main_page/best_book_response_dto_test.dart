class testBook {
  final int id;
  final int rankingId;
  final String? state;
  final String title;
  final String writer;
  final String? titleIntro;
  final String? intro;
  final String bookPicUrl;

  testBook(
      {required this.id,
      required this.rankingId,
      this.state,
      required this.title,
      required this.writer,
      this.titleIntro,
      this.intro,
      required this.bookPicUrl});
}
