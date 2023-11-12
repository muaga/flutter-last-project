import 'package:flutter/material.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/book_detail_expandable_description.dart';
import 'package:flutter_blog/ui/pages/custom/book_detail_page/widgets/view_model/book_detail_view_model.dart';

class BookDetailSubInfoForm extends StatelessWidget {
  const BookDetailSubInfoForm({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookDetailModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// TODO 대욱 : 목차, 저자, 출판사 데이터
        BookDetailExpandableDescription(
            title: "목차", description: book.sequence),
        BookDetailExpandableDescription(
            title: "저자 소개",
            description: "지은이_ ${book.bookWriter}\n"
                "\n"
                "${book.writerIntroduction}"),
        BookDetailExpandableDescription(
            title: "출판사 서평", description: book.review),
      ],
    );
  }
}
